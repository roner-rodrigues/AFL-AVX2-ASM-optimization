#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>
#include <stdlib.h>
#include "config.h"
#include "types.h"

u8 *d_virgin_bits;
u8 *d_trace_bits;
u8 *d_ret;
u8 *d_bitmap_changed;
u8 *cuda_ret;
u8 *cuda_bitmap_changed;

// Handle CUDA errors
#define HANDLE_ERROR(err) (HandleError(err, __FILE__, __LINE__))
void HandleError(cudaError_t err, const char *file, int line) {
    if (err != cudaSuccess) {
        printf("%s in %s at line %d\n", cudaGetErrorString(err), file, line);
        exit(EXIT_FAILURE);
    }
}

extern "C" void setup_device_memory()
{
    const size_t size_ret = sizeof(u8);
    const size_t size_bitmap_changed = sizeof(u8);
    const size_t size_arrays = MAP_SIZE * sizeof(u8);

    HANDLE_ERROR(cudaMalloc((void **)&d_virgin_bits, size_arrays));
    HANDLE_ERROR(cudaMalloc((void **)&d_trace_bits,  size_arrays));
    HANDLE_ERROR(cudaMalloc((void **)&d_bitmap_changed, size_bitmap_changed));
    HANDLE_ERROR(cudaMalloc((void **)&d_ret, size_ret));

    cuda_ret = (u8*)malloc(size_ret);
    cuda_bitmap_changed = (u8*)malloc(size_bitmap_changed);
}

extern "C" void cleanup_device_memory()
{
    cudaFree(d_virgin_bits);
    cudaFree(d_trace_bits);
    cudaFree(d_ret);
    cudaFree(d_bitmap_changed);
    free(cuda_ret);
    free(cuda_bitmap_changed);
}

__global__ void has_new_bits_kernel(u8 *virgin_map, u8 *trace_bits, unsigned int *ret, unsigned int *bitmap_changed) {
    const u32 total_elements = MAP_SIZE >> 3;
    const u32 total_threads = blockDim.x * gridDim.x;
    const u32 elements_per_thread = total_elements / total_threads;
    u32 idx = threadIdx.x + blockIdx.x * blockDim.x;
    u64* current = ((u64*)trace_bits) + idx;
    u64* virgin = ((u64*)virgin_map) + idx;
    u8 local_ret = 0;

    for(u32 i=0; i < elements_per_thread; i++) {
        if (*current && (*current & *virgin)) {
            if (local_ret < 2) {
                u8* cur = (u8*)current;
                u8* vir = (u8*)virgin;

                if ((cur[0] && vir[0] == 0xff) || (cur[1] && vir[1] == 0xff) ||
                    (cur[2] && vir[2] == 0xff) || (cur[3] && vir[3] == 0xff) ||
                    (cur[4] && vir[4] == 0xff) || (cur[5] && vir[5] == 0xff) ||
                    (cur[6] && vir[6] == 0xff) || (cur[7] && vir[7] == 0xff)) 
                    local_ret = 2;
                else 
                    local_ret = 1;
            }

            *virgin &= ~*current;
        }

        current += total_threads;
        virgin += total_threads;
    }

    atomicMax(ret, (unsigned int)local_ret);

    if(threadIdx.x == 0) {
        *bitmap_changed = 1U;
    }
}

extern "C" u8 call_has_new_bits_kernel(u8 *virgin_map, u8 *trace_bits, u8 *afl_bitmap_changed)
{
    HANDLE_ERROR(cudaMemcpy(d_virgin_bits, virgin_map, MAP_SIZE, cudaMemcpyHostToDevice));
    HANDLE_ERROR(cudaMemcpy(d_trace_bits, trace_bits, MAP_SIZE, cudaMemcpyHostToDevice));

    dim3 threads(256);
    dim3 blocks(960); 
    has_new_bits_kernel<<<blocks, threads>>>(d_virgin_bits, d_trace_bits, (unsigned int*)d_ret, (unsigned int*)d_bitmap_changed);

    HANDLE_ERROR(cudaDeviceSynchronize());

    HANDLE_ERROR(cudaMemcpy(virgin_map, d_virgin_bits, MAP_SIZE, cudaMemcpyDeviceToHost));
    HANDLE_ERROR(cudaMemcpy(cuda_ret, d_ret, sizeof(u8), cudaMemcpyDeviceToHost));
    HANDLE_ERROR(cudaMemcpy(cuda_bitmap_changed, d_bitmap_changed, sizeof(u8), cudaMemcpyDeviceToHost));

    *afl_bitmap_changed = *cuda_bitmap_changed;

    return *cuda_ret;
}
