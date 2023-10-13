section .text
global has_new_bits_asm

; Argumentos:
; rdi = u8* trace_bits
; rsi = u8* virgin_bits
; rdx = u8* bitmap_changed

has_new_bits_asm:
    ; Inicializa o contador i
    ; mov ecx, 8192    ; 16
    ; mov ecx, 16384   ; 17
    mov ecx, 32768   ; 18
    ; mov ecx, 65536   ; 19
    ; mov ecx, 131072  ; 20

    ; Inicializa ret = 0
    xor r8b, r8b          ; r8b = ret

.loop:
    ; Prefetching - carrega os próximos dados em cache
    prefetchnta [rdi + 512]
    prefetchnta [rsi + 512]

    ; Processa 8 blocos de uma vez
    ; Vamos usar um loop desenrolado para isso
    xor r9, r9            ; r9 = contador do loop desenrolado
.unrolled_loop:
    vmovdqu ymm0, [rdi + r9]
    vmovdqu ymm1, [rsi + r9]
    vpand ymm0, ymm0, ymm1
    vptest ymm0, ymm0
    jnz .found_bit

    add r9, 32
    cmp r9, 256
    jl .unrolled_loop

    ; Se chegamos aqui, passamos por todos os 8 blocos sem encontrar um bit
.next_iteration:
    add rdi, 256
    add rsi, 256
    sub ecx, 32
    jnz .loop
    jmp .end

.found_bit:
    mov r8b, 2

    ; Checa cada byte
    xor r10, r10  ; r10 = contador de bytes dentro do bloco YMM
.byte_loop:
    mov al, byte [rdi + r9 - 32 + r10]
    test al, al
    jz .next_byte

    cmp byte [rsi + r9 - 32 + r10], 0xff
    jnz .next_byte

    ; Se chegou aqui, encontrou um byte válido
    ; E atualiza o byte correspondente em virgin_bits
    mov byte [rsi + r9 - 32 + r10], al

.next_byte:
    inc r10
    cmp r10, 32
    jl .byte_loop

    jmp .next_iteration

.end:
    ; Atualiza bitmap_changed se necessário
    test r8b, r8b
    jz .finish
    mov byte [rdx], 1

.finish:
    ; Limpar os registros YMM para evitar vazamentos de dados
    vzeroupper
    mov al, r8b
    ret
