section .text
global has_new_bits_asm_optimz

; Argumentos:
; rdi = u8* trace_bits
; rsi = u8* virgin_bits
; rdx = u8* bitmap_changed

has_new_bits_asm_optimz:
    ; Inicializa o contador i 
    mov ecx, 256      ; MAP_SIZE = 64KB 

    ; Inicializa ret = 0
    xor r8b, r8b       

.loop:
    ; Prefetching dos dados da próxima e da subsequente iteração em cache
    prefetchnta [rdi + 512]
    prefetchnta [rsi + 512]

    ; 8 iterações desenroladas
    xor r9b, r9b ; r9b = flag para bit encontrado
    xor r10, r10 ; r10 = offset total a partir da base

.iterate:
    vmovdqu ymm0, [rdi + r10]
    vmovdqu ymm1, [rsi + r10]
    vpand ymm2, ymm0, ymm1 ; ymm2 usado para a verificação atual
    vptest ymm0, ymm0
    jz .next_block
    ; Se *current é não-zero, verifica byte a byte
    mov rax, r10
    call .check_byte_by_byte
    jmp .set_found_bit_if_needed

.next_block:
    add r10, 32
    cmp r10, 256
    jnz .iterate
    jmp .next_iteration

.check_byte_by_byte:
    ; Verifica byte a byte
    mov r11, 0 ; Contador de byte
.check_next_byte:
    movzx r12, byte [rdi + rax + r11] ; Carrega byte de current
    test r12, r12
    jz .byte_checked ; Se o byte de current é zero, pula para o próximo
    movzx r13, byte [rsi + rax + r11] ; Carrega byte correspondente de virgin
    cmp r13, 0xFF
    je .found_exact_match ; Encontrou correspondência exata
    mov r8b, 1 ; Não-zero em current sem correspondência exata
.byte_checked:
    inc r11
    cmp r11, 32
    jl .check_next_byte
    ret

.found_exact_match:
    ; Define r9b se uma correspondência exata for encontrada
    mov r9b, 1
    ret

.set_found_bit_if_needed:
    test r9b, r9b
    jz .next_block
    mov r8b, 2 ; Encontrou correspondência exata
    jmp .next_block

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

.end:
    ; Limpa os registros YMM para evitar vazamentos de dados
    vzeroupper
    ; Define o retorno da função
    mov al, r8b
    ret
