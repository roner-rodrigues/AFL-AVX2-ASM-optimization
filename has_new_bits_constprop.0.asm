00000000000094a0 <has_new_bits.constprop.0>:
push   rbp
mov    rbp,rsp
call   QWORD PTR [rip+0x27b36]        # 30fe0
lea    rsi,[rip+0x39252f]        # 39b9e0 <virgin_bits>
mov    r10,QWORD PTR [rip+0x3d2528]        # 3db9e0
xor    r8d,r8d
lea    rdi,[rsi+0x40000]
jmp    9518 <has_new_bits.constprop.0+0x78>
nop    DWORD PTR [rax+0x0]
mov    rcx,QWORD PTR [r10+0x8]
lea    r11,[r10+0x8]
lea    rax,[rsi+0x8]
test   rcx,rcx
jne    9770 <has_new_bits.constprop.0+0x2d0>
mov    rcx,QWORD PTR [r11+0x8]
lea    rdx,[r11+0x8]
lea    r9,[rax+0x8]
test   rcx,rcx
jne    96b0 <has_new_bits.constprop.0+0x210>
mov    r9,QWORD PTR [r11+0x10]
lea    rsi,[r11+0x10]
lea    rdx,[rax+0x10]
test   r9,r9
jne    95d8 <has_new_bits.constprop.0+0x138>
lea    rsi,[rax+0x18]
lea    r10,[r11+0x18]
cmp    rsi,rdi
je     9699 <has_new_bits.constprop.0+0x1f9>
mov    rax,QWORD PTR [r10]
test   rax,rax
je     94c8 <has_new_bits.constprop.0+0x28>
mov    rdx,QWORD PTR [rsi]
test   rax,rdx
je     94c8 <has_new_bits.constprop.0+0x28>
cmp    r8b,0x2
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [r10],0x0
jne    982a <has_new_bits.constprop.0+0x38a>
cmp    BYTE PTR [r10+0x1],0x0
je     954f <has_new_bits.constprop.0+0xaf>
cmp    BYTE PTR [rsi+0x1],0xff
mov    r8d,0x2
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [r10+0x2],0x0
je     9562 <has_new_bits.constprop.0+0xc2>
cmp    BYTE PTR [rsi+0x2],0xff
mov    r8d,0x2
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [r10+0x3],0x0
je     9575 <has_new_bits.constprop.0+0xd5>
cmp    BYTE PTR [rsi+0x3],0xff
mov    r8d,0x2
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [r10+0x4],0x0
je     9588 <has_new_bits.constprop.0+0xe8>
cmp    BYTE PTR [rsi+0x4],0xff
mov    r8d,0x2
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [r10+0x5],0x0
je     959b <has_new_bits.constprop.0+0xfb>
cmp    BYTE PTR [rsi+0x5],0xff
mov    r8d,0x2
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [r10+0x6],0x0
je     95ae <has_new_bits.constprop.0+0x10e>
cmp    BYTE PTR [rsi+0x6],0xff
mov    r8d,0x2
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [r10+0x7],0x0
mov    r8d,0x1
je     95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [rsi+0x7],0xff
sete   r8b
add    r8d,0x1
not    rax
and    rax,rdx
mov    QWORD PTR [rsi],rax
jmp    94c8 <has_new_bits.constprop.0+0x28>
nop    DWORD PTR [rax]
mov    rcx,QWORD PTR [rax+0x10]
test   r9,rcx
je     9507 <has_new_bits.constprop.0+0x67>
cmp    r8b,0x2
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [r11+0x10],0x0
jne    983e <has_new_bits.constprop.0+0x39e>
cmp    BYTE PTR [rsi+0x1],0x0
je     960c <has_new_bits.constprop.0+0x16c>
cmp    BYTE PTR [rdx+0x1],0xff
mov    r8d,0x2
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rsi+0x2],0x0
je     961e <has_new_bits.constprop.0+0x17e>
cmp    BYTE PTR [rdx+0x2],0xff
mov    r8d,0x2
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rsi+0x3],0x0
je     9630 <has_new_bits.constprop.0+0x190>
cmp    BYTE PTR [rdx+0x3],0xff
mov    r8d,0x2
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rsi+0x4],0x0
je     9642 <has_new_bits.constprop.0+0x1a2>
cmp    BYTE PTR [rdx+0x4],0xff
mov    r8d,0x2
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rsi+0x5],0x0
je     9654 <has_new_bits.constprop.0+0x1b4>
cmp    BYTE PTR [rdx+0x5],0xff
mov    r8d,0x2
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rsi+0x6],0x0
je     9666 <has_new_bits.constprop.0+0x1c6>
cmp    BYTE PTR [rdx+0x6],0xff
mov    r8d,0x2
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rsi+0x7],0x0
mov    r8d,0x1
je     967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rdx+0x7],0xff
sete   r8b
add    r8d,0x1
not    r9
lea    rsi,[rax+0x18]
lea    r10,[r11+0x18]
and    r9,rcx
mov    QWORD PTR [rax+0x10],r9
cmp    rsi,rdi
jne    9518 <has_new_bits.constprop.0+0x78>
test   r8b,r8b
je     96a5 <has_new_bits.constprop.0+0x205>
mov    BYTE PTR [rip+0x2798c],0x1        # 31031
mov    eax,r8d
pop    rbp
ret    
nop    WORD PTR [rax+rax*1+0x0]
mov    r10,QWORD PTR [rax+0x8]
test   rcx,r10
je     94f2 <has_new_bits.constprop.0+0x52>
cmp    r8b,0x2
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [r11+0x8],0x0
jne    9853 <has_new_bits.constprop.0+0x3b3>
cmp    BYTE PTR [rdx+0x1],0x0
je     96e5 <has_new_bits.constprop.0+0x245>
cmp    BYTE PTR [r9+0x1],0xff
mov    r8d,0x2
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [rdx+0x2],0x0
je     96f8 <has_new_bits.constprop.0+0x258>
cmp    BYTE PTR [r9+0x2],0xff
mov    r8d,0x2
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [rdx+0x3],0x0
je     970b <has_new_bits.constprop.0+0x26b>
cmp    BYTE PTR [r9+0x3],0xff
mov    r8d,0x2
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [rdx+0x4],0x0
je     971e <has_new_bits.constprop.0+0x27e>
cmp    BYTE PTR [r9+0x4],0xff
mov    r8d,0x2
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [rdx+0x5],0x0
je     9731 <has_new_bits.constprop.0+0x291>
cmp    BYTE PTR [r9+0x5],0xff
mov    r8d,0x2
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [rdx+0x6],0x0
je     9744 <has_new_bits.constprop.0+0x2a4>
cmp    BYTE PTR [r9+0x6],0xff
mov    r8d,0x2
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [rdx+0x7],0x0
mov    r8d,0x1
je     975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [r9+0x7],0xff
sete   r8b
add    r8d,0x1
not    rcx
and    rcx,r10
mov    QWORD PTR [rax+0x8],rcx
jmp    94f2 <has_new_bits.constprop.0+0x52>
nop    DWORD PTR [rax+0x0]
mov    rsi,QWORD PTR [rsi+0x8]
test   rcx,rsi
je     94dd <has_new_bits.constprop.0+0x3d>
cmp    r8b,0x2
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [r11],0x0
jne    9868 <has_new_bits.constprop.0+0x3c8>
cmp    BYTE PTR [r11+0x1],0x0
je     97a4 <has_new_bits.constprop.0+0x304>
cmp    BYTE PTR [rax+0x1],0xff
mov    r8d,0x2
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [r11+0x2],0x0
je     97b7 <has_new_bits.constprop.0+0x317>
cmp    BYTE PTR [rax+0x2],0xff
mov    r8d,0x2
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [r11+0x3],0x0
je     97ca <has_new_bits.constprop.0+0x32a>
cmp    BYTE PTR [rax+0x3],0xff
mov    r8d,0x2
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [r11+0x4],0x0
je     97dd <has_new_bits.constprop.0+0x33d>
cmp    BYTE PTR [rax+0x4],0xff
mov    r8d,0x2
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [r11+0x5],0x0
je     97f0 <has_new_bits.constprop.0+0x350>
cmp    BYTE PTR [rax+0x5],0xff
mov    r8d,0x2
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [r11+0x6],0x0
je     9803 <has_new_bits.constprop.0+0x363>
cmp    BYTE PTR [rax+0x6],0xff
mov    r8d,0x2
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [r11+0x7],0x0
mov    r8d,0x1
je     981c <has_new_bits.constprop.0+0x37c>
cmp    BYTE PTR [rax+0x7],0xff
sete   r8b
add    r8d,0x1
not    rcx
and    rcx,rsi
mov    QWORD PTR [rax],rcx
jmp    94dd <has_new_bits.constprop.0+0x3d>
cmp    BYTE PTR [rsi],0xff
mov    r8d,0x2
jne    953c <has_new_bits.constprop.0+0x9c>
jmp    95c7 <has_new_bits.constprop.0+0x127>
cmp    BYTE PTR [rax+0x10],0xff
mov    r8d,0x2
jne    95fa <has_new_bits.constprop.0+0x15a>
jmp    967e <has_new_bits.constprop.0+0x1de>
cmp    BYTE PTR [rax+0x8],0xff
mov    r8d,0x2
jne    96d2 <has_new_bits.constprop.0+0x232>
jmp    975d <has_new_bits.constprop.0+0x2bd>
cmp    BYTE PTR [rax],0xff
mov    r8d,0x2
jne    9791 <has_new_bits.constprop.0+0x2f1>
jmp    981c <has_new_bits.constprop.0+0x37c>
nop    DWORD PTR [rax+0x0]

