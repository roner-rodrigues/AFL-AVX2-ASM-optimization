#ifndef KERNEL_H
#define KERNEL_H

#include "types.h" 

// Declaração das funções que serão definidas em kernel.cu
#ifdef __cplusplus
extern "C" {
#endif

void setup_device_memory();
void cleanup_device_memory();
u8 call_has_new_bits_kernel(u8 *virgin_map, u8 *trace_bits, u8 *bitmap_changed);

#ifdef __cplusplus
}
#endif

#endif // KERNEL_H
