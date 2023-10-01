section .text
global has_new_bits_asm

; Argumentos:
; rdi = u8* trace_bits
; rsi = u8* virgin_bits
; rdx = u8* bitmap_changed

has_new_bits_asm:
    ; Inicializa o contador i
    ; mov ecx, 8192   ; 16
    mov ecx, 262144   ; 18
    ; mov ecx, 131072 ; 20
    shr ecx, 3

    ; Inicializa ret = 0
    xor r8b, r8b          ; r8b = ret

.loop:
    ; Testa se (*trace_bits & *virgin_bits) == 0
    mov rax, [rdi]        ; carrega *trace_bits em rax
    test rax, rax         ; testa *trace_bits
    jz .next_iteration

    ; Testa *trace_bits & *virgin_bits
    and rax, [rsi]
    test rax, rax
    jz .next_iteration

    ; Verifica se ret < 2
    cmp r8b, 2
    jae .update_virgin_bits

    ; Checa cada byte
    xor r9, r9            ; r9 = contador de bytes
.byte_loop:
    mov al, byte [rdi + r9]
    test al, al
    jz .next_byte
    cmp byte [rsi + r9], 0xff
    jnz .next_byte

    ; Se chegou aqui, encontrou um byte válido
    mov r8b, 2
    jmp .update_virgin_bits

.next_byte:
    inc r9
    cmp r9, 8
    jl .byte_loop

    ; Se chegou aqui, então nenhum byte era válido
    cmp r8b, 0
    je .set_ret_one

.update_virgin_bits:
    mov rax, [rdi]
    not rax
    and [rsi], rax

.next_iteration:
    add rdi, 8
    add rsi, 8
    dec ecx
    jnz .loop
    jmp .end

.set_ret_one:
    mov r8b, 1
    jmp .update_virgin_bits

.end:
    ; Atualiza bitmap_changed se necessário
    test r8b, r8b
    jz .finish
    mov byte [rdx], 1

.finish:
    mov al, r8b
    ret
