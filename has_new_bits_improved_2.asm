section .text
global has_new_bits_asm

; Argumentos:
; rdi = u8* virgin_map
; rsi = u8* trace_bits
; rdx = u8* bitmap_changed

MAP_SIZE equ 16384

has_new_bits_asm:
    ; Inicializa r8 (current) e r9 (virgin) para os ponteiros 64 bits
    mov r8, rsi        ; r8 = current = trace_bits
    mov r9, rdi        ; r9 = virgin = virgin_map
    
    ; Inicializa rcx (i) como MAP_SIZE / 8
    mov rcx, MAP_SIZE

    ; Inicializa r10b (ret) como 0
    xor r10b, r10b     ; r10b = ret

.loop:
    ; Otimize para (*current & *virgin) == 0
    mov rax, [r8]      ; rax = *current
    test rax, rax
    jz .skip_iteration

    and rax, [r9]
    test rax, rax
    jz .skip_iteration

    ; Verifica se ret < 2
    cmp r10b, 2
    jae .update_virgin_map

    ; Cheque cada byte de current e virgin
    xor r11, r11       ; r11 = byte counter
.byte_loop:
    mov al, [r8 + r11]
    test al, al
    jz .next_byte

    cmp byte [r9 + r11], 0xff
    jnz .next_byte

    ; Se chegou aqui, encontrou um byte válido
    mov r10b, 2
    jmp .update_virgin_map

.next_byte:
    inc r11
    cmp r11, 8
    jl .byte_loop

    ; Se chegou aqui, então nenhum byte era válido e ret ainda é 0
    mov r10b, 1

.update_virgin_map:
    mov rax, [r8]
    not rax
    and [r9], rax

.skip_iteration:
    add r8, 8            ; Incrementa o ponteiro 'current' para o próximo u64
    add r9, 8            ; Incrementa o ponteiro 'virgin' para o próximo u64
    dec rcx              ; Decrementa o contador i
    jnz .loop            ; Se ainda não processou todo o mapa, continue

    ; Verifica se precisa atualizar bitmap_changed
    test r10b, r10b      ; Verifica se ret é 0
    jz .finish           ; Se ret for 0, finalize
    cmp rdi, rdx         ; Se virgin_map (rdi) é igual a bitmap_changed (rdx)
    jne .finish

    ; Se chegou aqui, virgin_map é igual a bitmap_changed
    mov byte [rdx], 1

.finish:
    ; Retorna o valor em r10b (ret)
    mov al, r10b
    ret

