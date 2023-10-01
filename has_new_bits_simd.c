#include <immintrin.h> // Para instruções AVX2
#include "config.h" 
#include "types.h" 


u8 has_new_bits_simd(u8* trace_bits, u8* virgin_map, u8* bitmap_changed) {
    __m256i* current = (__m256i*)trace_bits;
    __m256i* virgin  = (__m256i*)virgin_map;
    u8 ret = 0;

    // Como __m256i lida com 256 bits por vez, precisamos ajustar o loop
    for (u32 i = 0; i < (MAP_SIZE / 32); i++) {
        __m256i curr_vector   = _mm256_load_si256(current + i);
        __m256i virgin_vector = _mm256_load_si256(virgin + i);

        // Verifica se qualquer bit em curr_vector também está em virgin_vector
        __m256i and_result = _mm256_and_si256(curr_vector, virgin_vector);

        // Se todos os bits são 0, não há novos bits
        if (!_mm256_testz_si256(and_result, and_result)) {
            // Aqui, você pode adicionar o código específico para lidar com novos bits
            // Como exemplo, apenas definimos ret para 1
            ret = 1;
            
            // Atualiza virgin_vector para remover os bits que já foram vistos
            __m256i updated_virgin = _mm256_andnot_si256(curr_vector, virgin_vector);
            _mm256_store_si256(virgin + i, updated_virgin);
        }
    }

    if (ret) *bitmap_changed = 1;
    // *bitmap_changed = (ret > 0) ? 1 : 0;

    return ret;
}
