
build/blank.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       00000194  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             00000370  08000194  08000194  00010194  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000004  08000504  08000504  00010504  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  08000508  08000508  00010508  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08000510  08000510  00010510  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             0000042c  20000000  08000514  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000020  2000042c  08000940  0002042c  2**2  ALLOC
  7 ._user_heap_stack 00000600  2000044c  08000940  0002044c  2**0  ALLOC
  8 .ARM.attributes   0000002a  00000000  00000000  0002042c  2**0  CONTENTS, READONLY
  9 .debug_info       00000b24  00000000  00000000  00020456  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 10 .debug_abbrev     000002da  00000000  00000000  00020f7a  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 11 .debug_loc        000002c4  00000000  00000000  00021254  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 12 .debug_aranges    00000078  00000000  00000000  00021518  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 13 .debug_ranges     00000058  00000000  00000000  00021590  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 14 .debug_line       00000420  00000000  00000000  000215e8  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 15 .debug_str        000003f6  00000000  00000000  00021a08  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 16 .comment          00000049  00000000  00000000  00021dfe  2**0  CONTENTS, READONLY
 17 .debug_frame      00000328  00000000  00000000  00021e48  2**2  CONTENTS, READONLY, DEBUGGING, OCTETS

Disassembly of section .text:

08000194 <__do_global_dtors_aux>:
 8000194:	b510      	push	{r4, lr}
 8000196:	4c05      	ldr	r4, [pc, #20]	; (80001ac <__do_global_dtors_aux+0x18>)
 8000198:	7823      	ldrb	r3, [r4, #0]
 800019a:	b933      	cbnz	r3, 80001aa <__do_global_dtors_aux+0x16>
 800019c:	4b04      	ldr	r3, [pc, #16]	; (80001b0 <__do_global_dtors_aux+0x1c>)
 800019e:	b113      	cbz	r3, 80001a6 <__do_global_dtors_aux+0x12>
 80001a0:	4804      	ldr	r0, [pc, #16]	; (80001b4 <__do_global_dtors_aux+0x20>)
 80001a2:	f3af 8000 	nop.w
 80001a6:	2301      	movs	r3, #1
 80001a8:	7023      	strb	r3, [r4, #0]
 80001aa:	bd10      	pop	{r4, pc}
 80001ac:	2000042c 	.word	0x2000042c
 80001b0:	00000000 	.word	0x00000000
 80001b4:	080004ec 	.word	0x080004ec

080001b8 <frame_dummy>:
 80001b8:	b508      	push	{r3, lr}
 80001ba:	4b03      	ldr	r3, [pc, #12]	; (80001c8 <frame_dummy+0x10>)
 80001bc:	b11b      	cbz	r3, 80001c6 <frame_dummy+0xe>
 80001be:	4903      	ldr	r1, [pc, #12]	; (80001cc <frame_dummy+0x14>)
 80001c0:	4803      	ldr	r0, [pc, #12]	; (80001d0 <frame_dummy+0x18>)
 80001c2:	f3af 8000 	nop.w
 80001c6:	bd08      	pop	{r3, pc}
 80001c8:	00000000 	.word	0x00000000
 80001cc:	20000430 	.word	0x20000430
 80001d0:	080004ec 	.word	0x080004ec

080001d4 <Reset_Handler>:
 80001d4:	f8df d034 	ldr.w	sp, [pc, #52]	; 800020c <LoopFillZerobss+0x14>
 80001d8:	2100      	movs	r1, #0
 80001da:	e003      	b.n	80001e4 <LoopCopyDataInit>

080001dc <CopyDataInit>:
 80001dc:	4b0c      	ldr	r3, [pc, #48]	; (8000210 <LoopFillZerobss+0x18>)
 80001de:	585b      	ldr	r3, [r3, r1]
 80001e0:	5043      	str	r3, [r0, r1]
 80001e2:	3104      	adds	r1, #4

080001e4 <LoopCopyDataInit>:
 80001e4:	480b      	ldr	r0, [pc, #44]	; (8000214 <LoopFillZerobss+0x1c>)
 80001e6:	4b0c      	ldr	r3, [pc, #48]	; (8000218 <LoopFillZerobss+0x20>)
 80001e8:	1842      	adds	r2, r0, r1
 80001ea:	429a      	cmp	r2, r3
 80001ec:	d3f6      	bcc.n	80001dc <CopyDataInit>
 80001ee:	4a0b      	ldr	r2, [pc, #44]	; (800021c <LoopFillZerobss+0x24>)
 80001f0:	e002      	b.n	80001f8 <LoopFillZerobss>

080001f2 <FillZerobss>:
 80001f2:	2300      	movs	r3, #0
 80001f4:	f842 3b04 	str.w	r3, [r2], #4

080001f8 <LoopFillZerobss>:
 80001f8:	4b09      	ldr	r3, [pc, #36]	; (8000220 <LoopFillZerobss+0x28>)
 80001fa:	429a      	cmp	r2, r3
 80001fc:	d3f9      	bcc.n	80001f2 <FillZerobss>
 80001fe:	f000 f8b3 	bl	8000368 <SystemInit>
 8000202:	f000 f8df 	bl	80003c4 <__libc_init_array>
 8000206:	f000 f899 	bl	800033c <main>
 800020a:	4770      	bx	lr
 800020c:	20010000 	.word	0x20010000
 8000210:	08000514 	.word	0x08000514
 8000214:	20000000 	.word	0x20000000
 8000218:	2000042c 	.word	0x2000042c
 800021c:	2000042c 	.word	0x2000042c
 8000220:	2000044c 	.word	0x2000044c

08000224 <ADC_IRQHandler>:
 8000224:	e7fe      	b.n	8000224 <ADC_IRQHandler>
	...

08000228 <LL_AHB1_GRP1_EnableClock>:
 8000228:	b480      	push	{r7}
 800022a:	b085      	sub	sp, #20
 800022c:	af00      	add	r7, sp, #0
 800022e:	6078      	str	r0, [r7, #4]
 8000230:	4b08      	ldr	r3, [pc, #32]	; (8000254 <LL_AHB1_GRP1_EnableClock+0x2c>)
 8000232:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000234:	4907      	ldr	r1, [pc, #28]	; (8000254 <LL_AHB1_GRP1_EnableClock+0x2c>)
 8000236:	687b      	ldr	r3, [r7, #4]
 8000238:	4313      	orrs	r3, r2
 800023a:	630b      	str	r3, [r1, #48]	; 0x30
 800023c:	4b05      	ldr	r3, [pc, #20]	; (8000254 <LL_AHB1_GRP1_EnableClock+0x2c>)
 800023e:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000240:	687b      	ldr	r3, [r7, #4]
 8000242:	4013      	ands	r3, r2
 8000244:	60fb      	str	r3, [r7, #12]
 8000246:	68fb      	ldr	r3, [r7, #12]
 8000248:	bf00      	nop
 800024a:	3714      	adds	r7, #20
 800024c:	46bd      	mov	sp, r7
 800024e:	bc80      	pop	{r7}
 8000250:	4770      	bx	lr
 8000252:	bf00      	nop
 8000254:	40023800 	.word	0x40023800

08000258 <LL_GPIO_SetPinMode>:
 8000258:	b480      	push	{r7}
 800025a:	b089      	sub	sp, #36	; 0x24
 800025c:	af00      	add	r7, sp, #0
 800025e:	60f8      	str	r0, [r7, #12]
 8000260:	60b9      	str	r1, [r7, #8]
 8000262:	607a      	str	r2, [r7, #4]
 8000264:	68fb      	ldr	r3, [r7, #12]
 8000266:	681a      	ldr	r2, [r3, #0]
 8000268:	68bb      	ldr	r3, [r7, #8]
 800026a:	617b      	str	r3, [r7, #20]
 800026c:	697b      	ldr	r3, [r7, #20]
 800026e:	fa93 f3a3 	rbit	r3, r3
 8000272:	613b      	str	r3, [r7, #16]
 8000274:	693b      	ldr	r3, [r7, #16]
 8000276:	fab3 f383 	clz	r3, r3
 800027a:	b2db      	uxtb	r3, r3
 800027c:	005b      	lsls	r3, r3, #1
 800027e:	2103      	movs	r1, #3
 8000280:	fa01 f303 	lsl.w	r3, r1, r3
 8000284:	43db      	mvns	r3, r3
 8000286:	401a      	ands	r2, r3
 8000288:	68bb      	ldr	r3, [r7, #8]
 800028a:	61fb      	str	r3, [r7, #28]
 800028c:	69fb      	ldr	r3, [r7, #28]
 800028e:	fa93 f3a3 	rbit	r3, r3
 8000292:	61bb      	str	r3, [r7, #24]
 8000294:	69bb      	ldr	r3, [r7, #24]
 8000296:	fab3 f383 	clz	r3, r3
 800029a:	b2db      	uxtb	r3, r3
 800029c:	005b      	lsls	r3, r3, #1
 800029e:	6879      	ldr	r1, [r7, #4]
 80002a0:	fa01 f303 	lsl.w	r3, r1, r3
 80002a4:	431a      	orrs	r2, r3
 80002a6:	68fb      	ldr	r3, [r7, #12]
 80002a8:	601a      	str	r2, [r3, #0]
 80002aa:	bf00      	nop
 80002ac:	3724      	adds	r7, #36	; 0x24
 80002ae:	46bd      	mov	sp, r7
 80002b0:	bc80      	pop	{r7}
 80002b2:	4770      	bx	lr

080002b4 <LL_GPIO_SetOutputPin>:
 80002b4:	b480      	push	{r7}
 80002b6:	b083      	sub	sp, #12
 80002b8:	af00      	add	r7, sp, #0
 80002ba:	6078      	str	r0, [r7, #4]
 80002bc:	6039      	str	r1, [r7, #0]
 80002be:	687b      	ldr	r3, [r7, #4]
 80002c0:	683a      	ldr	r2, [r7, #0]
 80002c2:	619a      	str	r2, [r3, #24]
 80002c4:	bf00      	nop
 80002c6:	370c      	adds	r7, #12
 80002c8:	46bd      	mov	sp, r7
 80002ca:	bc80      	pop	{r7}
 80002cc:	4770      	bx	lr

080002ce <LL_GPIO_ResetOutputPin>:
 80002ce:	b480      	push	{r7}
 80002d0:	b083      	sub	sp, #12
 80002d2:	af00      	add	r7, sp, #0
 80002d4:	6078      	str	r0, [r7, #4]
 80002d6:	6039      	str	r1, [r7, #0]
 80002d8:	683b      	ldr	r3, [r7, #0]
 80002da:	041a      	lsls	r2, r3, #16
 80002dc:	687b      	ldr	r3, [r7, #4]
 80002de:	619a      	str	r2, [r3, #24]
 80002e0:	bf00      	nop
 80002e2:	370c      	adds	r7, #12
 80002e4:	46bd      	mov	sp, r7
 80002e6:	bc80      	pop	{r7}
 80002e8:	4770      	bx	lr
	...

080002ec <gpio_config>:
 80002ec:	b580      	push	{r7, lr}
 80002ee:	af00      	add	r7, sp, #0
 80002f0:	2004      	movs	r0, #4
 80002f2:	f7ff ff99 	bl	8000228 <LL_AHB1_GRP1_EnableClock>
 80002f6:	2201      	movs	r2, #1
 80002f8:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 80002fc:	4802      	ldr	r0, [pc, #8]	; (8000308 <gpio_config+0x1c>)
 80002fe:	f7ff ffab 	bl	8000258 <LL_GPIO_SetPinMode>
 8000302:	bf00      	nop
 8000304:	bd80      	pop	{r7, pc}
 8000306:	bf00      	nop
 8000308:	40020800 	.word	0x40020800

0800030c <delay>:
 800030c:	b480      	push	{r7}
 800030e:	b083      	sub	sp, #12
 8000310:	af00      	add	r7, sp, #0
 8000312:	2300      	movs	r3, #0
 8000314:	607b      	str	r3, [r7, #4]
 8000316:	2300      	movs	r3, #0
 8000318:	607b      	str	r3, [r7, #4]
 800031a:	e002      	b.n	8000322 <delay+0x16>
 800031c:	687b      	ldr	r3, [r7, #4]
 800031e:	3301      	adds	r3, #1
 8000320:	607b      	str	r3, [r7, #4]
 8000322:	687b      	ldr	r3, [r7, #4]
 8000324:	4a04      	ldr	r2, [pc, #16]	; (8000338 <delay+0x2c>)
 8000326:	4293      	cmp	r3, r2
 8000328:	ddf8      	ble.n	800031c <delay+0x10>
 800032a:	2300      	movs	r3, #0
 800032c:	607b      	str	r3, [r7, #4]
 800032e:	bf00      	nop
 8000330:	370c      	adds	r7, #12
 8000332:	46bd      	mov	sp, r7
 8000334:	bc80      	pop	{r7}
 8000336:	4770      	bx	lr
 8000338:	000f423f 	.word	0x000f423f

0800033c <main>:
 800033c:	b580      	push	{r7, lr}
 800033e:	af00      	add	r7, sp, #0
 8000340:	f7ff ffd4 	bl	80002ec <gpio_config>
 8000344:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8000348:	4806      	ldr	r0, [pc, #24]	; (8000364 <main+0x28>)
 800034a:	f7ff ffb3 	bl	80002b4 <LL_GPIO_SetOutputPin>
 800034e:	f7ff ffdd 	bl	800030c <delay>
 8000352:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8000356:	4803      	ldr	r0, [pc, #12]	; (8000364 <main+0x28>)
 8000358:	f7ff ffb9 	bl	80002ce <LL_GPIO_ResetOutputPin>
 800035c:	f7ff ffd6 	bl	800030c <delay>
 8000360:	e7f0      	b.n	8000344 <main+0x8>
 8000362:	bf00      	nop
 8000364:	40020800 	.word	0x40020800

08000368 <SystemInit>:
 8000368:	b480      	push	{r7}
 800036a:	af00      	add	r7, sp, #0
 800036c:	4b12      	ldr	r3, [pc, #72]	; (80003b8 <SystemInit+0x50>)
 800036e:	681b      	ldr	r3, [r3, #0]
 8000370:	4a11      	ldr	r2, [pc, #68]	; (80003b8 <SystemInit+0x50>)
 8000372:	f043 0301 	orr.w	r3, r3, #1
 8000376:	6013      	str	r3, [r2, #0]
 8000378:	4b0f      	ldr	r3, [pc, #60]	; (80003b8 <SystemInit+0x50>)
 800037a:	2200      	movs	r2, #0
 800037c:	609a      	str	r2, [r3, #8]
 800037e:	4b0e      	ldr	r3, [pc, #56]	; (80003b8 <SystemInit+0x50>)
 8000380:	681b      	ldr	r3, [r3, #0]
 8000382:	4a0d      	ldr	r2, [pc, #52]	; (80003b8 <SystemInit+0x50>)
 8000384:	f023 7384 	bic.w	r3, r3, #17301504	; 0x1080000
 8000388:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 800038c:	6013      	str	r3, [r2, #0]
 800038e:	4b0a      	ldr	r3, [pc, #40]	; (80003b8 <SystemInit+0x50>)
 8000390:	4a0a      	ldr	r2, [pc, #40]	; (80003bc <SystemInit+0x54>)
 8000392:	605a      	str	r2, [r3, #4]
 8000394:	4b08      	ldr	r3, [pc, #32]	; (80003b8 <SystemInit+0x50>)
 8000396:	681b      	ldr	r3, [r3, #0]
 8000398:	4a07      	ldr	r2, [pc, #28]	; (80003b8 <SystemInit+0x50>)
 800039a:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
 800039e:	6013      	str	r3, [r2, #0]
 80003a0:	4b05      	ldr	r3, [pc, #20]	; (80003b8 <SystemInit+0x50>)
 80003a2:	2200      	movs	r2, #0
 80003a4:	60da      	str	r2, [r3, #12]
 80003a6:	4b06      	ldr	r3, [pc, #24]	; (80003c0 <SystemInit+0x58>)
 80003a8:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80003ac:	609a      	str	r2, [r3, #8]
 80003ae:	bf00      	nop
 80003b0:	46bd      	mov	sp, r7
 80003b2:	bc80      	pop	{r7}
 80003b4:	4770      	bx	lr
 80003b6:	bf00      	nop
 80003b8:	40023800 	.word	0x40023800
 80003bc:	24003010 	.word	0x24003010
 80003c0:	e000ed00 	.word	0xe000ed00

080003c4 <__libc_init_array>:
 80003c4:	b570      	push	{r4, r5, r6, lr}
 80003c6:	4e0d      	ldr	r6, [pc, #52]	; (80003fc <__libc_init_array+0x38>)
 80003c8:	4d0d      	ldr	r5, [pc, #52]	; (8000400 <__libc_init_array+0x3c>)
 80003ca:	1b76      	subs	r6, r6, r5
 80003cc:	10b6      	asrs	r6, r6, #2
 80003ce:	d006      	beq.n	80003de <__libc_init_array+0x1a>
 80003d0:	2400      	movs	r4, #0
 80003d2:	f855 3b04 	ldr.w	r3, [r5], #4
 80003d6:	3401      	adds	r4, #1
 80003d8:	4798      	blx	r3
 80003da:	42a6      	cmp	r6, r4
 80003dc:	d1f9      	bne.n	80003d2 <__libc_init_array+0xe>
 80003de:	4e09      	ldr	r6, [pc, #36]	; (8000404 <__libc_init_array+0x40>)
 80003e0:	4d09      	ldr	r5, [pc, #36]	; (8000408 <__libc_init_array+0x44>)
 80003e2:	1b76      	subs	r6, r6, r5
 80003e4:	f000 f882 	bl	80004ec <_init>
 80003e8:	10b6      	asrs	r6, r6, #2
 80003ea:	d006      	beq.n	80003fa <__libc_init_array+0x36>
 80003ec:	2400      	movs	r4, #0
 80003ee:	f855 3b04 	ldr.w	r3, [r5], #4
 80003f2:	3401      	adds	r4, #1
 80003f4:	4798      	blx	r3
 80003f6:	42a6      	cmp	r6, r4
 80003f8:	d1f9      	bne.n	80003ee <__libc_init_array+0x2a>
 80003fa:	bd70      	pop	{r4, r5, r6, pc}
 80003fc:	08000508 	.word	0x08000508
 8000400:	08000508 	.word	0x08000508
 8000404:	08000510 	.word	0x08000510
 8000408:	08000508 	.word	0x08000508

0800040c <register_fini>:
 800040c:	4b02      	ldr	r3, [pc, #8]	; (8000418 <register_fini+0xc>)
 800040e:	b113      	cbz	r3, 8000416 <register_fini+0xa>
 8000410:	4802      	ldr	r0, [pc, #8]	; (800041c <register_fini+0x10>)
 8000412:	f000 b805 	b.w	8000420 <atexit>
 8000416:	4770      	bx	lr
 8000418:	00000000 	.word	0x00000000
 800041c:	0800042d 	.word	0x0800042d

08000420 <atexit>:
 8000420:	2300      	movs	r3, #0
 8000422:	4601      	mov	r1, r0
 8000424:	461a      	mov	r2, r3
 8000426:	4618      	mov	r0, r3
 8000428:	f000 b81a 	b.w	8000460 <__register_exitproc>

0800042c <__libc_fini_array>:
 800042c:	b538      	push	{r3, r4, r5, lr}
 800042e:	4b08      	ldr	r3, [pc, #32]	; (8000450 <__libc_fini_array+0x24>)
 8000430:	4d08      	ldr	r5, [pc, #32]	; (8000454 <__libc_fini_array+0x28>)
 8000432:	1b5b      	subs	r3, r3, r5
 8000434:	109c      	asrs	r4, r3, #2
 8000436:	d007      	beq.n	8000448 <__libc_fini_array+0x1c>
 8000438:	3b04      	subs	r3, #4
 800043a:	441d      	add	r5, r3
 800043c:	3c01      	subs	r4, #1
 800043e:	f855 3904 	ldr.w	r3, [r5], #-4
 8000442:	4798      	blx	r3
 8000444:	2c00      	cmp	r4, #0
 8000446:	d1f9      	bne.n	800043c <__libc_fini_array+0x10>
 8000448:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800044c:	f000 b854 	b.w	80004f8 <_fini>
 8000450:	08000514 	.word	0x08000514
 8000454:	08000510 	.word	0x08000510

08000458 <__retarget_lock_acquire_recursive>:
 8000458:	4770      	bx	lr
 800045a:	bf00      	nop

0800045c <__retarget_lock_release_recursive>:
 800045c:	4770      	bx	lr
 800045e:	bf00      	nop

08000460 <__register_exitproc>:
 8000460:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8000464:	f8df a07c 	ldr.w	sl, [pc, #124]	; 80004e4 <__register_exitproc+0x84>
 8000468:	4606      	mov	r6, r0
 800046a:	f8da 0000 	ldr.w	r0, [sl]
 800046e:	4698      	mov	r8, r3
 8000470:	460f      	mov	r7, r1
 8000472:	4691      	mov	r9, r2
 8000474:	f7ff fff0 	bl	8000458 <__retarget_lock_acquire_recursive>
 8000478:	4b1b      	ldr	r3, [pc, #108]	; (80004e8 <__register_exitproc+0x88>)
 800047a:	681b      	ldr	r3, [r3, #0]
 800047c:	f8d3 4148 	ldr.w	r4, [r3, #328]	; 0x148
 8000480:	b324      	cbz	r4, 80004cc <__register_exitproc+0x6c>
 8000482:	6865      	ldr	r5, [r4, #4]
 8000484:	2d1f      	cmp	r5, #31
 8000486:	dc26      	bgt.n	80004d6 <__register_exitproc+0x76>
 8000488:	b95e      	cbnz	r6, 80004a2 <__register_exitproc+0x42>
 800048a:	1c6b      	adds	r3, r5, #1
 800048c:	3502      	adds	r5, #2
 800048e:	f8da 0000 	ldr.w	r0, [sl]
 8000492:	6063      	str	r3, [r4, #4]
 8000494:	f844 7025 	str.w	r7, [r4, r5, lsl #2]
 8000498:	f7ff ffe0 	bl	800045c <__retarget_lock_release_recursive>
 800049c:	2000      	movs	r0, #0
 800049e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 80004a2:	eb04 0185 	add.w	r1, r4, r5, lsl #2
 80004a6:	2301      	movs	r3, #1
 80004a8:	f8c1 9088 	str.w	r9, [r1, #136]	; 0x88
 80004ac:	f8d4 2188 	ldr.w	r2, [r4, #392]	; 0x188
 80004b0:	40ab      	lsls	r3, r5
 80004b2:	431a      	orrs	r2, r3
 80004b4:	2e02      	cmp	r6, #2
 80004b6:	f8c4 2188 	str.w	r2, [r4, #392]	; 0x188
 80004ba:	f8c1 8108 	str.w	r8, [r1, #264]	; 0x108
 80004be:	d1e4      	bne.n	800048a <__register_exitproc+0x2a>
 80004c0:	f8d4 218c 	ldr.w	r2, [r4, #396]	; 0x18c
 80004c4:	4313      	orrs	r3, r2
 80004c6:	f8c4 318c 	str.w	r3, [r4, #396]	; 0x18c
 80004ca:	e7de      	b.n	800048a <__register_exitproc+0x2a>
 80004cc:	f503 74a6 	add.w	r4, r3, #332	; 0x14c
 80004d0:	f8c3 4148 	str.w	r4, [r3, #328]	; 0x148
 80004d4:	e7d5      	b.n	8000482 <__register_exitproc+0x22>
 80004d6:	f8da 0000 	ldr.w	r0, [sl]
 80004da:	f7ff ffbf 	bl	800045c <__retarget_lock_release_recursive>
 80004de:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 80004e2:	e7dc      	b.n	800049e <__register_exitproc+0x3e>
 80004e4:	20000428 	.word	0x20000428
 80004e8:	08000504 	.word	0x08000504

080004ec <_init>:
 80004ec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80004ee:	bf00      	nop
 80004f0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80004f2:	bc08      	pop	{r3}
 80004f4:	469e      	mov	lr, r3
 80004f6:	4770      	bx	lr

080004f8 <_fini>:
 80004f8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80004fa:	bf00      	nop
 80004fc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80004fe:	bc08      	pop	{r3}
 8000500:	469e      	mov	lr, r3
 8000502:	4770      	bx	lr
