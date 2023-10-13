section .text
global has_new_bits_asm

; Argumentos:
; rdi = u8* trace_bits
; rsi = u8* virgin_bits
; rdx = u8* bitmap_changed

has_new_bits_asm:
    ; Prólogo: Salva a pilha antiga e define uma nova
    push rbp
    mov rbp, rsp

    ; Prólogo: Salva os registradores
    push rbx
    push r12
    push r13
    push r14
    push r15

    ; Carrega os argumentos da função
    mov r12, rdi ; virgin_map
    mov r13, rsi ; trace_bits
    mov r14, rdx ; ponteiro para bitmap_changed

    ; Inicializa contadores
    xor rax, rax  ; ret = 0
    xor rcx, rcx  ; contador do loop
    mov r15, 4096 ; condição de término do loop (dividido por 2 devido ao loop unrolling)

loop_start:
    ; SIMD: Carrega registradores YMM de 256 bits com dados de trace_bits
    vmovdqu ymm0, yword [r13 + rcx * 8]
    vmovdqu ymm1, yword [r13 + rcx * 8 + 32] ; próximos 32 bytes

    ; SIMD: Testa se current[i] é zero
    vptest ymm0, ymm0
    vptest ymm1, ymm1
    jz loop_end

    ; SIMD: Executa operação AND bitwise em virgin_map e trace_bits
    vmovdqu ymm2, yword [r12 + rcx * 8]
    vmovdqu ymm3, yword [r12 + rcx * 8 + 32] ; próximos 32 bytes

    vpand ymm0, ymm0, ymm2
    vpand ymm1, ymm1, ymm3

    vptest ymm0, ymm0
    vptest ymm1, ymm1
    jz loop_end

    ; SIMD: Compara bytes diferentes de zero em current[] e virgin[]
    vpcmpeqb ymm2, ymm0, ymm2
    vpcmpeqb ymm3, ymm1, ymm3

    vpmovmskb eax, ymm2
    vpmovmskb edx, ymm3

    ; Verifica se algum byte é virgem, se sim, então ret = 2, se não, ret = 1
    or eax, edx
    jz non_zero_byte_found
    mov eax, 1
    jmp update_virgin_map

non_zero_byte_found:
    mov eax, 2

update_virgin_map:
    ; SIMD: Executa *virgin &= ~*current
    vpandn ymm0, ymm0, ymm2
    vpandn ymm1, ymm1, ymm3
    vmovdqu yword [r12 + rcx * 8], ymm0
    vmovdqu yword [r12 + rcx * 8 + 32], ymm1 ; próximos 32 bytes

loop_end:
    ; Loop unrolling: Incrementa o contador do loop em 4, processando dessa forma 2 elementos de 256 bits (32 bytes) por iteração
    add rcx, 4
    cmp rcx, r15
    jl loop_start

    ; Atualiza bitmap_changed se ret for diferente de zero
    test eax, eax
    jz skip_update_bitmap_changed
    mov byte [r14], 1

skip_update_bitmap_changed:
    ; Epílogo: Restaura os regitradores
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx

    ; Epílogo: Restaura a pilha e retorna
    leave
    ret




