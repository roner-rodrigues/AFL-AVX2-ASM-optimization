section .text
global has_new_bits_asm_optimz

; Argumentos:
; rdi = u8* trace_bits
; rsi = u8* virgin_bits
; rdx = u8* bitmap_changed

has_new_bits_asm_optimz:
    ; Inicializa o contador i 
    mov ecx, 256      ; MAP_SIZE = 64KB 

    ; Prepara a constante 0xFFFFFFFFFFFFFFFF
    mov rax, 0xFFFFFFFFFFFFFFFF
    movq xmm0, rax
    vpbroadcastq ymm3, xmm0  ; ymm3 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF

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
    vmovdqu ymm0, [rdi + r10] ; cur
    vmovdqu ymm1, [rsi + r10] ; vir

    ; Verifica se cur[i] não é zero
    vpcmpeqb ymm2, ymm0, ymm4  ; Compara cur com 0, resulta em 0xFF onde cur[i] != 0
    vpxor ymm2, ymm2, ymm3     ; Inverte o resultado, agora 0xFF onde cur[i] != 0

    ; Verifica se vir[i] é igual a 0xFF
    vpcmpeqb ymm1, ymm1, ymm3  ; Compara vir com 0xFF, resulta em 0xFF onde vir[i] == 0xFF

    ; Combinar as verificações
    vpand ymm0, ymm2, ymm1     ; 0xFF onde ambas as condições são verdadeiras
    vptest ymm0, ymm0
    jnz .set_found_bit         ; Pula se qualquer bit no ymm0 for 1

    add r10, 32
    cmp r10, 256
    jnz .iterate

.next_iteration:
    add rdi, 256
    add rsi, 256
    sub ecx, 64
    xor r10, r10 ; Zera o r10 para a próxima iteração
    xor r9b, r9b ; Zera o r9b para a próxima iteração
    jnz .loop

    ; Verifica se algum bit foi encontrado e .set_found_bit não foi chamado
    test r8b, r8b
    jnz .found_bit_set
    test r9b, r9b
    jz .end
    mov al, 1
    jmp .finalize

.found_bit_set:
    ; Atualiza bitmap_changed se necessário
    mov byte [rdx], 1
    mov al, 2

.finalize:
    vzeroall 
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
    vzeroall 
    ; Define o retorno da função
    mov al, r8b
    ret
