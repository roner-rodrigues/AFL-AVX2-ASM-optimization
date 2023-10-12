
00000000000094a0 <has_new_bits.constprop.0>:
    94a0:	55                   	push   rbp
    94a1:	48 89 e5             	mov    rbp,rsp
    94a4:	ff 15 36 7b 02 00    	call   QWORD PTR [rip+0x27b36]        # 30fe0 <mcount@GLIBC_2.2.5>
    94aa:	48 8d 35 2f 25 39 00 	lea    rsi,[rip+0x39252f]        # 39b9e0 <virgin_bits>
    94b1:	4c 8b 15 28 25 3d 00 	mov    r10,QWORD PTR [rip+0x3d2528]        # 3db9e0 <trace_bits>
    94b8:	45 31 c0             	xor    r8d,r8d
    94bb:	48 8d be 00 00 04 00 	lea    rdi,[rsi+0x40000]
    94c2:	eb 54                	jmp    9518 <has_new_bits.constprop.0+0x78>
    94c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    94c8:	49 8b 4a 08          	mov    rcx,QWORD PTR [r10+0x8]
    94cc:	4d 8d 5a 08          	lea    r11,[r10+0x8]
    94d0:	48 8d 46 08          	lea    rax,[rsi+0x8]
    94d4:	48 85 c9             	test   rcx,rcx
    94d7:	0f 85 93 02 00 00    	jne    9770 <has_new_bits.constprop.0+0x2d0>
    94dd:	49 8b 4b 08          	mov    rcx,QWORD PTR [r11+0x8]
    94e1:	49 8d 53 08          	lea    rdx,[r11+0x8]
    94e5:	4c 8d 48 08          	lea    r9,[rax+0x8]
    94e9:	48 85 c9             	test   rcx,rcx
    94ec:	0f 85 be 01 00 00    	jne    96b0 <has_new_bits.constprop.0+0x210>
    94f2:	4d 8b 4b 10          	mov    r9,QWORD PTR [r11+0x10]
    94f6:	49 8d 73 10          	lea    rsi,[r11+0x10]
    94fa:	48 8d 50 10          	lea    rdx,[rax+0x10]
    94fe:	4d 85 c9             	test   r9,r9
    9501:	0f 85 d1 00 00 00    	jne    95d8 <has_new_bits.constprop.0+0x138>
    9507:	48 8d 70 18          	lea    rsi,[rax+0x18]
    950b:	4d 8d 53 18          	lea    r10,[r11+0x18]
    950f:	48 39 fe             	cmp    rsi,rdi
    9512:	0f 84 81 01 00 00    	je     9699 <has_new_bits.constprop.0+0x1f9>
    9518:	49 8b 02             	mov    rax,QWORD PTR [r10]
    951b:	48 85 c0             	test   rax,rax
    951e:	74 a8                	je     94c8 <has_new_bits.constprop.0+0x28>
    9520:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
    9523:	48 85 d0             	test   rax,rdx
    9526:	74 a0                	je     94c8 <has_new_bits.constprop.0+0x28>
    9528:	41 80 f8 02          	cmp    r8b,0x2
    952c:	0f 84 95 00 00 00    	je     95c7 <has_new_bits.constprop.0+0x127>
    9532:	41 80 3a 00          	cmp    BYTE PTR [r10],0x0
    9536:	0f 85 ee 02 00 00    	jne    982a <has_new_bits.constprop.0+0x38a>
    953c:	41 80 7a 01 00       	cmp    BYTE PTR [r10+0x1],0x0
    9541:	74 0c                	je     954f <has_new_bits.constprop.0+0xaf>
    9543:	80 7e 01 ff          	cmp    BYTE PTR [rsi+0x1],0xff
    9547:	41 b8 02 00 00 00    	mov    r8d,0x2
    954d:	74 78                	je     95c7 <has_new_bits.constprop.0+0x127>
    954f:	41 80 7a 02 00       	cmp    BYTE PTR [r10+0x2],0x0
    9554:	74 0c                	je     9562 <has_new_bits.constprop.0+0xc2>
    9556:	80 7e 02 ff          	cmp    BYTE PTR [rsi+0x2],0xff
    955a:	41 b8 02 00 00 00    	mov    r8d,0x2
    9560:	74 65                	je     95c7 <has_new_bits.constprop.0+0x127>
    9562:	41 80 7a 03 00       	cmp    BYTE PTR [r10+0x3],0x0
    9567:	74 0c                	je     9575 <has_new_bits.constprop.0+0xd5>
    9569:	80 7e 03 ff          	cmp    BYTE PTR [rsi+0x3],0xff
    956d:	41 b8 02 00 00 00    	mov    r8d,0x2
    9573:	74 52                	je     95c7 <has_new_bits.constprop.0+0x127>
    9575:	41 80 7a 04 00       	cmp    BYTE PTR [r10+0x4],0x0
    957a:	74 0c                	je     9588 <has_new_bits.constprop.0+0xe8>
    957c:	80 7e 04 ff          	cmp    BYTE PTR [rsi+0x4],0xff
    9580:	41 b8 02 00 00 00    	mov    r8d,0x2
    9586:	74 3f                	je     95c7 <has_new_bits.constprop.0+0x127>
    9588:	41 80 7a 05 00       	cmp    BYTE PTR [r10+0x5],0x0
    958d:	74 0c                	je     959b <has_new_bits.constprop.0+0xfb>
    958f:	80 7e 05 ff          	cmp    BYTE PTR [rsi+0x5],0xff
    9593:	41 b8 02 00 00 00    	mov    r8d,0x2
    9599:	74 2c                	je     95c7 <has_new_bits.constprop.0+0x127>
    959b:	41 80 7a 06 00       	cmp    BYTE PTR [r10+0x6],0x0
    95a0:	74 0c                	je     95ae <has_new_bits.constprop.0+0x10e>
    95a2:	80 7e 06 ff          	cmp    BYTE PTR [rsi+0x6],0xff
    95a6:	41 b8 02 00 00 00    	mov    r8d,0x2
    95ac:	74 19                	je     95c7 <has_new_bits.constprop.0+0x127>
    95ae:	41 80 7a 07 00       	cmp    BYTE PTR [r10+0x7],0x0
    95b3:	41 b8 01 00 00 00    	mov    r8d,0x1
    95b9:	74 0c                	je     95c7 <has_new_bits.constprop.0+0x127>
    95bb:	80 7e 07 ff          	cmp    BYTE PTR [rsi+0x7],0xff
    95bf:	41 0f 94 c0          	sete   r8b
    95c3:	41 83 c0 01          	add    r8d,0x1
    95c7:	48 f7 d0             	not    rax
    95ca:	48 21 d0             	and    rax,rdx
    95cd:	48 89 06             	mov    QWORD PTR [rsi],rax
    95d0:	e9 f3 fe ff ff       	jmp    94c8 <has_new_bits.constprop.0+0x28>
    95d5:	0f 1f 00             	nop    DWORD PTR [rax]
    95d8:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
    95dc:	49 85 c9             	test   r9,rcx
    95df:	0f 84 22 ff ff ff    	je     9507 <has_new_bits.constprop.0+0x67>
    95e5:	41 80 f8 02          	cmp    r8b,0x2
    95e9:	0f 84 8f 00 00 00    	je     967e <has_new_bits.constprop.0+0x1de>
    95ef:	41 80 7b 10 00       	cmp    BYTE PTR [r11+0x10],0x0
    95f4:	0f 85 44 02 00 00    	jne    983e <has_new_bits.constprop.0+0x39e>
    95fa:	80 7e 01 00          	cmp    BYTE PTR [rsi+0x1],0x0
    95fe:	74 0c                	je     960c <has_new_bits.constprop.0+0x16c>
    9600:	80 7a 01 ff          	cmp    BYTE PTR [rdx+0x1],0xff
    9604:	41 b8 02 00 00 00    	mov    r8d,0x2
    960a:	74 72                	je     967e <has_new_bits.constprop.0+0x1de>
    960c:	80 7e 02 00          	cmp    BYTE PTR [rsi+0x2],0x0
    9610:	74 0c                	je     961e <has_new_bits.constprop.0+0x17e>
    9612:	80 7a 02 ff          	cmp    BYTE PTR [rdx+0x2],0xff
    9616:	41 b8 02 00 00 00    	mov    r8d,0x2
    961c:	74 60                	je     967e <has_new_bits.constprop.0+0x1de>
    961e:	80 7e 03 00          	cmp    BYTE PTR [rsi+0x3],0x0
    9622:	74 0c                	je     9630 <has_new_bits.constprop.0+0x190>
    9624:	80 7a 03 ff          	cmp    BYTE PTR [rdx+0x3],0xff
    9628:	41 b8 02 00 00 00    	mov    r8d,0x2
    962e:	74 4e                	je     967e <has_new_bits.constprop.0+0x1de>
    9630:	80 7e 04 00          	cmp    BYTE PTR [rsi+0x4],0x0
    9634:	74 0c                	je     9642 <has_new_bits.constprop.0+0x1a2>
    9636:	80 7a 04 ff          	cmp    BYTE PTR [rdx+0x4],0xff
    963a:	41 b8 02 00 00 00    	mov    r8d,0x2
    9640:	74 3c                	je     967e <has_new_bits.constprop.0+0x1de>
    9642:	80 7e 05 00          	cmp    BYTE PTR [rsi+0x5],0x0
    9646:	74 0c                	je     9654 <has_new_bits.constprop.0+0x1b4>
    9648:	80 7a 05 ff          	cmp    BYTE PTR [rdx+0x5],0xff
    964c:	41 b8 02 00 00 00    	mov    r8d,0x2
    9652:	74 2a                	je     967e <has_new_bits.constprop.0+0x1de>
    9654:	80 7e 06 00          	cmp    BYTE PTR [rsi+0x6],0x0
    9658:	74 0c                	je     9666 <has_new_bits.constprop.0+0x1c6>
    965a:	80 7a 06 ff          	cmp    BYTE PTR [rdx+0x6],0xff
    965e:	41 b8 02 00 00 00    	mov    r8d,0x2
    9664:	74 18                	je     967e <has_new_bits.constprop.0+0x1de>
    9666:	80 7e 07 00          	cmp    BYTE PTR [rsi+0x7],0x0
    966a:	41 b8 01 00 00 00    	mov    r8d,0x1
    9670:	74 0c                	je     967e <has_new_bits.constprop.0+0x1de>
    9672:	80 7a 07 ff          	cmp    BYTE PTR [rdx+0x7],0xff
    9676:	41 0f 94 c0          	sete   r8b
    967a:	41 83 c0 01          	add    r8d,0x1
    967e:	49 f7 d1             	not    r9
    9681:	48 8d 70 18          	lea    rsi,[rax+0x18]
    9685:	4d 8d 53 18          	lea    r10,[r11+0x18]
    9689:	49 21 c9             	and    r9,rcx
    968c:	4c 89 48 10          	mov    QWORD PTR [rax+0x10],r9
    9690:	48 39 fe             	cmp    rsi,rdi
    9693:	0f 85 7f fe ff ff    	jne    9518 <has_new_bits.constprop.0+0x78>
    9699:	45 84 c0             	test   r8b,r8b
    969c:	74 07                	je     96a5 <has_new_bits.constprop.0+0x205>
    969e:	c6 05 8c 79 02 00 01 	mov    BYTE PTR [rip+0x2798c],0x1        # 31031 <bitmap_changed>
    96a5:	44 89 c0             	mov    eax,r8d
    96a8:	5d                   	pop    rbp
    96a9:	c3                   	ret    
    96aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    96b0:	4c 8b 50 08          	mov    r10,QWORD PTR [rax+0x8]
    96b4:	4c 85 d1             	test   rcx,r10
    96b7:	0f 84 35 fe ff ff    	je     94f2 <has_new_bits.constprop.0+0x52>
    96bd:	41 80 f8 02          	cmp    r8b,0x2
    96c1:	0f 84 96 00 00 00    	je     975d <has_new_bits.constprop.0+0x2bd>
    96c7:	41 80 7b 08 00       	cmp    BYTE PTR [r11+0x8],0x0
    96cc:	0f 85 81 01 00 00    	jne    9853 <has_new_bits.constprop.0+0x3b3>
    96d2:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
    96d6:	74 0d                	je     96e5 <has_new_bits.constprop.0+0x245>
    96d8:	41 80 79 01 ff       	cmp    BYTE PTR [r9+0x1],0xff
    96dd:	41 b8 02 00 00 00    	mov    r8d,0x2
    96e3:	74 78                	je     975d <has_new_bits.constprop.0+0x2bd>
    96e5:	80 7a 02 00          	cmp    BYTE PTR [rdx+0x2],0x0
    96e9:	74 0d                	je     96f8 <has_new_bits.constprop.0+0x258>
    96eb:	41 80 79 02 ff       	cmp    BYTE PTR [r9+0x2],0xff
    96f0:	41 b8 02 00 00 00    	mov    r8d,0x2
    96f6:	74 65                	je     975d <has_new_bits.constprop.0+0x2bd>
    96f8:	80 7a 03 00          	cmp    BYTE PTR [rdx+0x3],0x0
    96fc:	74 0d                	je     970b <has_new_bits.constprop.0+0x26b>
    96fe:	41 80 79 03 ff       	cmp    BYTE PTR [r9+0x3],0xff
    9703:	41 b8 02 00 00 00    	mov    r8d,0x2
    9709:	74 52                	je     975d <has_new_bits.constprop.0+0x2bd>
    970b:	80 7a 04 00          	cmp    BYTE PTR [rdx+0x4],0x0
    970f:	74 0d                	je     971e <has_new_bits.constprop.0+0x27e>
    9711:	41 80 79 04 ff       	cmp    BYTE PTR [r9+0x4],0xff
    9716:	41 b8 02 00 00 00    	mov    r8d,0x2
    971c:	74 3f                	je     975d <has_new_bits.constprop.0+0x2bd>
    971e:	80 7a 05 00          	cmp    BYTE PTR [rdx+0x5],0x0
    9722:	74 0d                	je     9731 <has_new_bits.constprop.0+0x291>
    9724:	41 80 79 05 ff       	cmp    BYTE PTR [r9+0x5],0xff
    9729:	41 b8 02 00 00 00    	mov    r8d,0x2
    972f:	74 2c                	je     975d <has_new_bits.constprop.0+0x2bd>
    9731:	80 7a 06 00          	cmp    BYTE PTR [rdx+0x6],0x0
    9735:	74 0d                	je     9744 <has_new_bits.constprop.0+0x2a4>
    9737:	41 80 79 06 ff       	cmp    BYTE PTR [r9+0x6],0xff
    973c:	41 b8 02 00 00 00    	mov    r8d,0x2
    9742:	74 19                	je     975d <has_new_bits.constprop.0+0x2bd>
    9744:	80 7a 07 00          	cmp    BYTE PTR [rdx+0x7],0x0
    9748:	41 b8 01 00 00 00    	mov    r8d,0x1
    974e:	74 0d                	je     975d <has_new_bits.constprop.0+0x2bd>
    9750:	41 80 79 07 ff       	cmp    BYTE PTR [r9+0x7],0xff
    9755:	41 0f 94 c0          	sete   r8b
    9759:	41 83 c0 01          	add    r8d,0x1
    975d:	48 f7 d1             	not    rcx
    9760:	4c 21 d1             	and    rcx,r10
    9763:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
    9767:	e9 86 fd ff ff       	jmp    94f2 <has_new_bits.constprop.0+0x52>
    976c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    9770:	48 8b 76 08          	mov    rsi,QWORD PTR [rsi+0x8]
    9774:	48 85 f1             	test   rcx,rsi
    9777:	0f 84 60 fd ff ff    	je     94dd <has_new_bits.constprop.0+0x3d>
    977d:	41 80 f8 02          	cmp    r8b,0x2
    9781:	0f 84 95 00 00 00    	je     981c <has_new_bits.constprop.0+0x37c>
    9787:	41 80 3b 00          	cmp    BYTE PTR [r11],0x0
    978b:	0f 85 d7 00 00 00    	jne    9868 <has_new_bits.constprop.0+0x3c8>
    9791:	41 80 7b 01 00       	cmp    BYTE PTR [r11+0x1],0x0
    9796:	74 0c                	je     97a4 <has_new_bits.constprop.0+0x304>
    9798:	80 78 01 ff          	cmp    BYTE PTR [rax+0x1],0xff
    979c:	41 b8 02 00 00 00    	mov    r8d,0x2
    97a2:	74 78                	je     981c <has_new_bits.constprop.0+0x37c>
    97a4:	41 80 7b 02 00       	cmp    BYTE PTR [r11+0x2],0x0
    97a9:	74 0c                	je     97b7 <has_new_bits.constprop.0+0x317>
    97ab:	80 78 02 ff          	cmp    BYTE PTR [rax+0x2],0xff
    97af:	41 b8 02 00 00 00    	mov    r8d,0x2
    97b5:	74 65                	je     981c <has_new_bits.constprop.0+0x37c>
    97b7:	41 80 7b 03 00       	cmp    BYTE PTR [r11+0x3],0x0
    97bc:	74 0c                	je     97ca <has_new_bits.constprop.0+0x32a>
    97be:	80 78 03 ff          	cmp    BYTE PTR [rax+0x3],0xff
    97c2:	41 b8 02 00 00 00    	mov    r8d,0x2
    97c8:	74 52                	je     981c <has_new_bits.constprop.0+0x37c>
    97ca:	41 80 7b 04 00       	cmp    BYTE PTR [r11+0x4],0x0
    97cf:	74 0c                	je     97dd <has_new_bits.constprop.0+0x33d>
    97d1:	80 78 04 ff          	cmp    BYTE PTR [rax+0x4],0xff
    97d5:	41 b8 02 00 00 00    	mov    r8d,0x2
    97db:	74 3f                	je     981c <has_new_bits.constprop.0+0x37c>
    97dd:	41 80 7b 05 00       	cmp    BYTE PTR [r11+0x5],0x0
    97e2:	74 0c                	je     97f0 <has_new_bits.constprop.0+0x350>
    97e4:	80 78 05 ff          	cmp    BYTE PTR [rax+0x5],0xff
    97e8:	41 b8 02 00 00 00    	mov    r8d,0x2
    97ee:	74 2c                	je     981c <has_new_bits.constprop.0+0x37c>
    97f0:	41 80 7b 06 00       	cmp    BYTE PTR [r11+0x6],0x0
    97f5:	74 0c                	je     9803 <has_new_bits.constprop.0+0x363>
    97f7:	80 78 06 ff          	cmp    BYTE PTR [rax+0x6],0xff
    97fb:	41 b8 02 00 00 00    	mov    r8d,0x2
    9801:	74 19                	je     981c <has_new_bits.constprop.0+0x37c>
    9803:	41 80 7b 07 00       	cmp    BYTE PTR [r11+0x7],0x0
    9808:	41 b8 01 00 00 00    	mov    r8d,0x1
    980e:	74 0c                	je     981c <has_new_bits.constprop.0+0x37c>
    9810:	80 78 07 ff          	cmp    BYTE PTR [rax+0x7],0xff
    9814:	41 0f 94 c0          	sete   r8b
    9818:	41 83 c0 01          	add    r8d,0x1
    981c:	48 f7 d1             	not    rcx
    981f:	48 21 f1             	and    rcx,rsi
    9822:	48 89 08             	mov    QWORD PTR [rax],rcx
    9825:	e9 b3 fc ff ff       	jmp    94dd <has_new_bits.constprop.0+0x3d>
    982a:	80 3e ff             	cmp    BYTE PTR [rsi],0xff
    982d:	41 b8 02 00 00 00    	mov    r8d,0x2
    9833:	0f 85 03 fd ff ff    	jne    953c <has_new_bits.constprop.0+0x9c>
    9839:	e9 89 fd ff ff       	jmp    95c7 <has_new_bits.constprop.0+0x127>
    983e:	80 78 10 ff          	cmp    BYTE PTR [rax+0x10],0xff
    9842:	41 b8 02 00 00 00    	mov    r8d,0x2
    9848:	0f 85 ac fd ff ff    	jne    95fa <has_new_bits.constprop.0+0x15a>
    984e:	e9 2b fe ff ff       	jmp    967e <has_new_bits.constprop.0+0x1de>
    9853:	80 78 08 ff          	cmp    BYTE PTR [rax+0x8],0xff
    9857:	41 b8 02 00 00 00    	mov    r8d,0x2
    985d:	0f 85 6f fe ff ff    	jne    96d2 <has_new_bits.constprop.0+0x232>
    9863:	e9 f5 fe ff ff       	jmp    975d <has_new_bits.constprop.0+0x2bd>
    9868:	80 38 ff             	cmp    BYTE PTR [rax],0xff
    986b:	41 b8 02 00 00 00    	mov    r8d,0x2
    9871:	0f 85 1a ff ff ff    	jne    9791 <has_new_bits.constprop.0+0x2f1>
    9877:	eb a3                	jmp    981c <has_new_bits.constprop.0+0x37c>
    9879:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

