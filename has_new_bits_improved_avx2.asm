section .text
global has_new_bits_asm

; Argumentos:
; rdi = u8* trace_bits
; rsi = u8* virgin_bits
; rdx = u8* bitmap_changed

has_new_bits_asm:
    ; Inicializa o contador i
    mov ecx, 8192    ; 16
    ; mov ecx, 16384   ; 17
    ; mov ecx, 32768   ; 18
    ; mov ecx, 65536   ; 19
    ; mov ecx, 131072  ; 20

    ; Inicializa ret = 0
    xor r8b, r8b          ; r8b = ret

.loop:
    ; Prefetching - carrega os próximos dados em cache
    prefetchnta [rdi + 512]
    prefetchnta [rsi + 512]

    ; 8 iterações desenroladas
    xor r9b, r9b          ; r9b = found bit flag
    xor r10, r10          ; r10 = total offset from base

.iterate:
    vmovdqu ymm0, [rdi + r10]
    vmovdqu ymm1, [rsi + r10]
    vpand ymm0, ymm0, ymm1
    vptest ymm0, ymm0
    jnz .set_found_bit

    add r10, 32
    cmp r10, 256
    jnz .iterate

.next_iteration:
    add rdi, 256
    add rsi, 256
    sub ecx, 64
    jnz .loop

    ; Verifica se algum bit foi encontrado
    test r9b, r9b
    jz .end

    ; Atualiza bitmap_changed se necessário
    mov byte [rdx], 1
    mov al, 2
    vzeroupper
    ret

.set_found_bit:
    ; Se um bit for encontrado, atualiza o mapa virgem e define a flag
    mov r8b, 2
    mov r9b, 1
    vmovdqu ymm1, [rdi + r10]
    vmovdqu ymm2, [rsi + r10]
    vpandn ymm2, ymm1, ymm2
    vmovdqu [rsi + r10], ymm2
    add r10, 32
    cmp r10, 256
    jnz .iterate
    jmp .next_iteration

.end:
    ; Limpa os registros YMM para evitar vazamentos de dados
    vzeroupper
    mov al, r8b
    ret
