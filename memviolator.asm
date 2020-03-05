
_memviolator:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

//-----MAIN FUNCTION-----
//Throws to the menu functions to complete the requested operations
//The menu functions handles the stuff
int main(int argc, char ** argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
    address[0] = (char *)0;
    address[1] = (char *)4294967040;
    address[2] = (char *)&main;
    address[3] = (char *)&_end;
    address[4] = (char *)&ptr;
    address[5] = (char *)&argv;
   e:	83 c1 04             	add    $0x4,%ecx
{
  11:	83 ec 10             	sub    $0x10,%esp
    * p = 0;
  14:	a1 90 14 00 00       	mov    0x1490,%eax
  19:	c6 00 00             	movb   $0x0,(%eax)
    ptr = malloc(1);
  1c:	6a 01                	push   $0x1
    address[5] = (char *)&argv;
  1e:	89 0d ac 14 00 00    	mov    %ecx,0x14ac
    address[0] = (char *)0;
  24:	c7 05 98 14 00 00 00 	movl   $0x0,0x1498
  2b:	00 00 00 
    address[1] = (char *)4294967040;
  2e:	c7 05 9c 14 00 00 00 	movl   $0xffffff00,0x149c
  35:	ff ff ff 
    address[2] = (char *)&main;
  38:	c7 05 a0 14 00 00 00 	movl   $0x0,0x14a0
  3f:	00 00 00 
    address[3] = (char *)&_end;
  42:	c7 05 a4 14 00 00 bc 	movl   $0x14bc,0x14a4
  49:	14 00 00 
    address[4] = (char *)&ptr;
  4c:	c7 05 a8 14 00 00 b0 	movl   $0x14b0,0x14a8
  53:	14 00 00 
    ptr = malloc(1);
  56:	e8 75 0b 00 00       	call   bd0 <malloc>
  5b:	a3 b0 14 00 00       	mov    %eax,0x14b0
    mainMenu();
  60:	e8 cb 04 00 00       	call   530 <mainMenu>
    free(ptr);
  65:	58                   	pop    %eax
  66:	ff 35 b0 14 00 00    	pushl  0x14b0
  6c:	e8 cf 0a 00 00       	call   b40 <free>
    #ifdef __pie__
        return 0;
    #else
        exit();
  71:	e8 ac 07 00 00       	call   822 <exit>
  76:	66 90                	xchg   %ax,%ax
  78:	66 90                	xchg   %ax,%ax
  7a:	66 90                	xchg   %ax,%ax
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <setPointerE.part.0>:
void setPointerE(int location)
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
            read(0, in, sizeof(in));
  84:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
void setPointerE(int location)
  87:	83 ec 2c             	sub    $0x2c,%esp
            printf(1, "Enter your custom address value:\n");
  8a:	68 c8 0c 00 00       	push   $0xcc8
  8f:	6a 01                	push   $0x1
  91:	e8 da 08 00 00       	call   970 <printf>
            read(0, in, sizeof(in));
  96:	83 c4 0c             	add    $0xc,%esp
  99:	6a 14                	push   $0x14
  9b:	53                   	push   %ebx
  9c:	6a 00                	push   $0x0
  9e:	e8 97 07 00 00       	call   83a <read>
            temp = atoi(in);
  a3:	89 1c 24             	mov    %ebx,(%esp)
  a6:	e8 05 07 00 00       	call   7b0 <atoi>
        *end = temp;
  ab:	8b 15 b4 14 00 00    	mov    0x14b4,%edx
  b1:	83 c4 10             	add    $0x10,%esp
  b4:	88 02                	mov    %al,(%edx)
}
  b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b9:	c9                   	leave  
  ba:	c3                   	ret    
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000c0 <printCompletion>:
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	83 ec 0c             	sub    $0xc,%esp
        printf(1, "Operation completed! The pointer is currently at: %p",p);
  c6:	ff 35 90 14 00 00    	pushl  0x1490
  cc:	68 ec 0c 00 00       	push   $0xcec
  d1:	6a 01                	push   $0x1
  d3:	e8 98 08 00 00       	call   970 <printf>
}
  d8:	83 c4 10             	add    $0x10,%esp
  db:	c9                   	leave  
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi

000000e0 <memoryViolatorR>:
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	56                   	push   %esi
  e4:	53                   	push   %ebx
  e5:	be 10 00 00 00       	mov    $0x10,%esi
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            printf(1, "%p: ", p);
  f0:	83 ec 04             	sub    $0x4,%esp
  f3:	ff 35 90 14 00 00    	pushl  0x1490
  f9:	bb 10 00 00 00       	mov    $0x10,%ebx
  fe:	68 a4 0f 00 00       	push   $0xfa4
 103:	6a 01                	push   $0x1
 105:	e8 66 08 00 00       	call   970 <printf>
 10a:	a1 90 14 00 00       	mov    0x1490,%eax
 10f:	83 c4 10             	add    $0x10,%esp
 112:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1, "%x", *p);
 118:	0f be 00             	movsbl (%eax),%eax
 11b:	83 ec 04             	sub    $0x4,%esp
 11e:	50                   	push   %eax
 11f:	68 a9 0f 00 00       	push   $0xfa9
 124:	6a 01                	push   $0x1
 126:	e8 45 08 00 00       	call   970 <printf>
            p++;
 12b:	a1 90 14 00 00       	mov    0x1490,%eax
        for(i = 0; i < 16; i++)
 130:	83 c4 10             	add    $0x10,%esp
            p++;
 133:	83 c0 01             	add    $0x1,%eax
        for(i = 0; i < 16; i++)
 136:	83 eb 01             	sub    $0x1,%ebx
            p++;
 139:	a3 90 14 00 00       	mov    %eax,0x1490
        for(i = 0; i < 16; i++)
 13e:	75 d8                	jne    118 <memoryViolatorR+0x38>
            printf(1, "\n");
 140:	83 ec 08             	sub    $0x8,%esp
 143:	68 b4 0f 00 00       	push   $0xfb4
 148:	6a 01                	push   $0x1
 14a:	e8 21 08 00 00       	call   970 <printf>
    for(j = 0; j < 16; j++)
 14f:	83 c4 10             	add    $0x10,%esp
 152:	83 ee 01             	sub    $0x1,%esi
 155:	75 99                	jne    f0 <memoryViolatorR+0x10>
}
 157:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15a:	5b                   	pop    %ebx
 15b:	5e                   	pop    %esi
 15c:	5d                   	pop    %ebp
 15d:	c3                   	ret    
 15e:	66 90                	xchg   %ax,%ax

00000160 <setPointer>:
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	83 ec 34             	sub    $0x34,%esp
 167:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(location < 0 )
 16a:	85 db                	test   %ebx,%ebx
 16c:	78 12                	js     180 <setPointer+0x20>
    p = (char*)temp;
 16e:	89 1d 90 14 00 00    	mov    %ebx,0x1490
}
 174:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 177:	c9                   	leave  
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printf(1, "Enter your custom address value:\n");
 180:	83 ec 08             	sub    $0x8,%esp
            read(0, in, sizeof(in));
 183:	8d 5d d0             	lea    -0x30(%ebp),%ebx
            printf(1, "Enter your custom address value:\n");
 186:	68 c8 0c 00 00       	push   $0xcc8
 18b:	6a 01                	push   $0x1
 18d:	e8 de 07 00 00       	call   970 <printf>
            read(0, in, sizeof(in));
 192:	83 c4 0c             	add    $0xc,%esp
 195:	6a 28                	push   $0x28
 197:	53                   	push   %ebx
 198:	6a 00                	push   $0x0
 19a:	e8 9b 06 00 00       	call   83a <read>
            temp = atoi(in);
 19f:	89 1c 24             	mov    %ebx,(%esp)
 1a2:	e8 09 06 00 00       	call   7b0 <atoi>
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 1a7:	83 c4 0c             	add    $0xc,%esp
 1aa:	ff 35 90 14 00 00    	pushl  0x1490
            temp = atoi(in);
 1b0:	89 c3                	mov    %eax,%ebx
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 1b2:	68 ec 0c 00 00       	push   $0xcec
 1b7:	6a 01                	push   $0x1
 1b9:	e8 b2 07 00 00       	call   970 <printf>
    p = (char*)temp;
 1be:	89 1d 90 14 00 00    	mov    %ebx,0x1490
 1c4:	83 c4 10             	add    $0x10,%esp
}
 1c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <setPointerE>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
    if(location < 0)
 1d6:	85 c0                	test   %eax,%eax
 1d8:	78 0e                	js     1e8 <setPointerE+0x18>
        *end = location;
 1da:	8b 15 b4 14 00 00    	mov    0x14b4,%edx
 1e0:	88 02                	mov    %al,(%edx)
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e8:	5d                   	pop    %ebp
 1e9:	e9 92 fe ff ff       	jmp    80 <setPointerE.part.0>
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <readCurr>:
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	83 ec 0c             	sub    $0xc,%esp
        printf(1, "%x: ", p);
 1f6:	ff 35 90 14 00 00    	pushl  0x1490
 1fc:	68 ac 0f 00 00       	push   $0xfac
 201:	6a 01                	push   $0x1
 203:	e8 68 07 00 00       	call   970 <printf>
        printf(1, "%x \n", *p);
 208:	a1 90 14 00 00       	mov    0x1490,%eax
 20d:	83 c4 0c             	add    $0xc,%esp
 210:	0f be 00             	movsbl (%eax),%eax
 213:	50                   	push   %eax
 214:	68 b1 0f 00 00       	push   $0xfb1
 219:	6a 01                	push   $0x1
 21b:	e8 50 07 00 00       	call   970 <printf>
}
 220:	83 c4 10             	add    $0x10,%esp
 223:	c9                   	leave  
 224:	c3                   	ret    
 225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <incrementer>:
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	83 ec 0c             	sub    $0xc,%esp
    p += amount;
 236:	a1 90 14 00 00       	mov    0x1490,%eax
 23b:	03 45 08             	add    0x8(%ebp),%eax
        printf(1, "Pointer is now set to %p.\n", p);
 23e:	50                   	push   %eax
 23f:	68 b6 0f 00 00       	push   $0xfb6
 244:	6a 01                	push   $0x1
    p += amount;
 246:	a3 90 14 00 00       	mov    %eax,0x1490
        printf(1, "Pointer is now set to %p.\n", p);
 24b:	e8 20 07 00 00       	call   970 <printf>
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 250:	83 c4 0c             	add    $0xc,%esp
 253:	ff 35 90 14 00 00    	pushl  0x1490
 259:	68 ec 0c 00 00       	push   $0xcec
 25e:	6a 01                	push   $0x1
 260:	e8 0b 07 00 00       	call   970 <printf>
}
 265:	83 c4 10             	add    $0x10,%esp
 268:	c9                   	leave  
 269:	c3                   	ret    
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <memoryViolatorW>:
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	83 ec 08             	sub    $0x8,%esp
    while(p != end)
 276:	a1 90 14 00 00       	mov    0x1490,%eax
 27b:	39 05 b4 14 00 00    	cmp    %eax,0x14b4
 281:	74 24                	je     2a7 <memoryViolatorW+0x37>
 283:	0f b6 55 08          	movzbl 0x8(%ebp),%edx
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        *p = value;
 290:	88 10                	mov    %dl,(%eax)
        p++;
 292:	a1 90 14 00 00       	mov    0x1490,%eax
 297:	83 c0 01             	add    $0x1,%eax
    while(p != end)
 29a:	3b 05 b4 14 00 00    	cmp    0x14b4,%eax
        p++;
 2a0:	a3 90 14 00 00       	mov    %eax,0x1490
    while(p != end)
 2a5:	75 e9                	jne    290 <memoryViolatorW+0x20>
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 2a7:	83 ec 04             	sub    $0x4,%esp
 2aa:	50                   	push   %eax
 2ab:	68 ec 0c 00 00       	push   $0xcec
 2b0:	6a 01                	push   $0x1
 2b2:	e8 b9 06 00 00       	call   970 <printf>
}
 2b7:	83 c4 10             	add    $0x10,%esp
 2ba:	c9                   	leave  
 2bb:	c3                   	ret    
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002c0 <singlewrite>:
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 0c             	sub    $0xc,%esp
    *p = value;
 2c6:	a1 90 14 00 00       	mov    0x1490,%eax
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
 2ce:	88 10                	mov    %dl,(%eax)
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 2d0:	ff 35 90 14 00 00    	pushl  0x1490
 2d6:	68 ec 0c 00 00       	push   $0xcec
 2db:	6a 01                	push   $0x1
 2dd:	e8 8e 06 00 00       	call   970 <printf>
}
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <readMenu>:
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
        read(0,integerthing, sizeof(integerthing));
 2f4:	8d 9d f0 fe ff ff    	lea    -0x110(%ebp),%ebx
{
 2fa:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
        printf(1,menuString);
 300:	68 24 0d 00 00       	push   $0xd24
 305:	6a 01                	push   $0x1
 307:	e8 64 06 00 00       	call   970 <printf>
        read(0,integerthing, sizeof(integerthing));
 30c:	83 c4 0c             	add    $0xc,%esp
 30f:	6a 14                	push   $0x14
 311:	53                   	push   %ebx
 312:	6a 00                	push   $0x0
 314:	e8 21 05 00 00       	call   83a <read>
        n = atoi(integerthing);
 319:	89 1c 24             	mov    %ebx,(%esp)
 31c:	e8 8f 04 00 00       	call   7b0 <atoi>
    switch(n)
 321:	83 c4 10             	add    $0x10,%esp
 324:	83 f8 01             	cmp    $0x1,%eax
    char tmp [44]= "What address would you like to read from?\n";
 327:	c7 85 04 ff ff ff 57 	movl   $0x74616857,-0xfc(%ebp)
 32e:	68 61 74 
 331:	c7 85 08 ff ff ff 20 	movl   $0x64646120,-0xf8(%ebp)
 338:	61 64 64 
 33b:	c7 85 0c ff ff ff 72 	movl   $0x73736572,-0xf4(%ebp)
 342:	65 73 73 
 345:	c7 85 10 ff ff ff 20 	movl   $0x756f7720,-0xf0(%ebp)
 34c:	77 6f 75 
 34f:	c7 85 14 ff ff ff 6c 	movl   $0x7920646c,-0xec(%ebp)
 356:	64 20 79 
 359:	c7 85 18 ff ff ff 6f 	movl   $0x6c20756f,-0xe8(%ebp)
 360:	75 20 6c 
 363:	c7 85 1c ff ff ff 69 	movl   $0x20656b69,-0xe4(%ebp)
 36a:	6b 65 20 
 36d:	c7 85 20 ff ff ff 74 	movl   $0x72206f74,-0xe0(%ebp)
 374:	6f 20 72 
 377:	c7 85 24 ff ff ff 65 	movl   $0x20646165,-0xdc(%ebp)
 37e:	61 64 20 
 381:	c7 85 28 ff ff ff 66 	movl   $0x6d6f7266,-0xd8(%ebp)
 388:	72 6f 6d 
 38b:	c7 85 2c ff ff ff 3f 	movl   $0xa3f,-0xd4(%ebp)
 392:	0a 00 00 
    switch(n)
 395:	74 79                	je     410 <readMenu+0x120>
 397:	7e 5f                	jle    3f8 <readMenu+0x108>
 399:	83 f8 02             	cmp    $0x2,%eax
 39c:	74 12                	je     3b0 <readMenu+0xc0>
 39e:	83 f8 03             	cmp    $0x3,%eax
 3a1:	75 59                	jne    3fc <readMenu+0x10c>
            readCurr();
 3a3:	e8 48 fe ff ff       	call   1f0 <readCurr>
}
 3a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ab:	c9                   	leave  
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
                printf(1,tmp);
 3b0:	8d 9d 04 ff ff ff    	lea    -0xfc(%ebp),%ebx
 3b6:	83 ec 08             	sub    $0x8,%esp
 3b9:	53                   	push   %ebx
 3ba:	6a 01                	push   $0x1
 3bc:	e8 af 05 00 00       	call   970 <printf>
                read(0,tmp, sizeof(integerthing));
 3c1:	83 c4 0c             	add    $0xc,%esp
 3c4:	68 c8 00 00 00       	push   $0xc8
 3c9:	53                   	push   %ebx
 3ca:	6a 00                	push   $0x0
 3cc:	e8 69 04 00 00       	call   83a <read>
                n = atoi(integerthing);
 3d1:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
 3d7:	89 04 24             	mov    %eax,(%esp)
 3da:	e8 d1 03 00 00       	call   7b0 <atoi>
            setPointer(n);
 3df:	89 04 24             	mov    %eax,(%esp)
 3e2:	e8 79 fd ff ff       	call   160 <setPointer>
            readCurr();
 3e7:	e8 04 fe ff ff       	call   1f0 <readCurr>
            return;
 3ec:	83 c4 10             	add    $0x10,%esp
}
 3ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f2:	c9                   	leave  
 3f3:	c3                   	ret    
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch(n)
 3f8:	85 c0                	test   %eax,%eax
 3fa:	74 ac                	je     3a8 <readMenu+0xb8>
                    printf(1,error);
 3fc:	50                   	push   %eax
 3fd:	50                   	push   %eax
 3fe:	ff 35 7c 14 00 00    	pushl  0x147c
 404:	6a 01                	push   $0x1
 406:	e8 65 05 00 00       	call   970 <printf>
                    exit();
 40b:	e8 12 04 00 00       	call   822 <exit>
            memoryViolatorR();
 410:	e8 cb fc ff ff       	call   e0 <memoryViolatorR>
}
 415:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 418:	c9                   	leave  
 419:	c3                   	ret    
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <writeMenu>:
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
        read(0,integerthing, sizeof(integerthing));
 424:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
{
 427:	83 ec 2c             	sub    $0x2c,%esp
        printf(1,menuString);
 42a:	68 c0 0d 00 00       	push   $0xdc0
 42f:	6a 01                	push   $0x1
 431:	e8 3a 05 00 00       	call   970 <printf>
        read(0,integerthing, sizeof(integerthing));
 436:	83 c4 0c             	add    $0xc,%esp
 439:	6a 14                	push   $0x14
 43b:	53                   	push   %ebx
 43c:	6a 00                	push   $0x0
 43e:	e8 f7 03 00 00       	call   83a <read>
        n = atoi(integerthing);
 443:	89 1c 24             	mov    %ebx,(%esp)
 446:	e8 65 03 00 00       	call   7b0 <atoi>
    switch(n)
 44b:	83 c4 10             	add    $0x10,%esp
 44e:	83 f8 01             	cmp    $0x1,%eax
 451:	74 5d                	je     4b0 <writeMenu+0x90>
 453:	7e 7b                	jle    4d0 <writeMenu+0xb0>
 455:	83 f8 02             	cmp    $0x2,%eax
 458:	74 36                	je     490 <writeMenu+0x70>
 45a:	83 f8 03             	cmp    $0x3,%eax
 45d:	75 75                	jne    4d4 <writeMenu+0xb4>
    *p = value;
 45f:	0f b6 15 78 14 00 00 	movzbl 0x1478,%edx
 466:	a1 90 14 00 00       	mov    0x1490,%eax
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 46b:	83 ec 04             	sub    $0x4,%esp
    *p = value;
 46e:	88 10                	mov    %dl,(%eax)
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 470:	ff 35 90 14 00 00    	pushl  0x1490
 476:	68 ec 0c 00 00       	push   $0xcec
 47b:	6a 01                	push   $0x1
 47d:	e8 ee 04 00 00       	call   970 <printf>
 482:	83 c4 10             	add    $0x10,%esp
}
 485:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 488:	c9                   	leave  
 489:	c3                   	ret    
 48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            setPointerE(atoi(address[1]));
 490:	83 ec 0c             	sub    $0xc,%esp
 493:	ff 35 9c 14 00 00    	pushl  0x149c
 499:	e8 12 03 00 00       	call   7b0 <atoi>
    if(location < 0)
 49e:	83 c4 10             	add    $0x10,%esp
 4a1:	85 c0                	test   %eax,%eax
 4a3:	78 0b                	js     4b0 <writeMenu+0x90>
        *end = location;
 4a5:	8b 15 b4 14 00 00    	mov    0x14b4,%edx
 4ab:	88 02                	mov    %al,(%edx)
 4ad:	eb 06                	jmp    4b5 <writeMenu+0x95>
 4af:	90                   	nop
 4b0:	e8 cb fb ff ff       	call   80 <setPointerE.part.0>
            memoryViolatorW(fillValue);
 4b5:	0f be 05 78 14 00 00 	movsbl 0x1478,%eax
 4bc:	83 ec 0c             	sub    $0xc,%esp
 4bf:	50                   	push   %eax
 4c0:	e8 ab fd ff ff       	call   270 <memoryViolatorW>
            return;
 4c5:	83 c4 10             	add    $0x10,%esp
}
 4c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cb:	c9                   	leave  
 4cc:	c3                   	ret    
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    switch(n)
 4d0:	85 c0                	test   %eax,%eax
 4d2:	74 b1                	je     485 <writeMenu+0x65>
                printf(1,error);
 4d4:	50                   	push   %eax
 4d5:	50                   	push   %eax
 4d6:	ff 35 7c 14 00 00    	pushl  0x147c
 4dc:	6a 01                	push   $0x1
 4de:	e8 8d 04 00 00       	call   970 <printf>
                exit();
 4e3:	e8 3a 03 00 00       	call   822 <exit>
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004f0 <pointerMenu>:
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
        read(0, addressIndex, sizeof(addressIndex));
 4f4:	8d 5d d0             	lea    -0x30(%ebp),%ebx
{
 4f7:	83 ec 3c             	sub    $0x3c,%esp
        printf(1, menuString);
 4fa:	68 58 0e 00 00       	push   $0xe58
 4ff:	6a 01                	push   $0x1
 501:	e8 6a 04 00 00       	call   970 <printf>
        read(0, addressIndex, sizeof(addressIndex));
 506:	83 c4 0c             	add    $0xc,%esp
 509:	6a 28                	push   $0x28
 50b:	53                   	push   %ebx
 50c:	6a 00                	push   $0x0
 50e:	e8 27 03 00 00       	call   83a <read>
    p = address[atoi(addressIndex)];
 513:	89 1c 24             	mov    %ebx,(%esp)
 516:	e8 95 02 00 00       	call   7b0 <atoi>
 51b:	8b 04 85 98 14 00 00 	mov    0x1498(,%eax,4),%eax
}
 522:	83 c4 10             	add    $0x10,%esp
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    p = address[atoi(addressIndex)];
 528:	a3 90 14 00 00       	mov    %eax,0x1490
}
 52d:	c9                   	leave  
 52e:	c3                   	ret    
 52f:	90                   	nop

00000530 <mainMenu>:
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
        read(0,integerthing, sizeof(integerthing));
 534:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
{
 537:	83 ec 2c             	sub    $0x2c,%esp
        printf(1,mainmenustring);
 53a:	68 18 0f 00 00       	push   $0xf18
 53f:	6a 01                	push   $0x1
 541:	e8 2a 04 00 00       	call   970 <printf>
        read(0,integerthing, sizeof(integerthing));
 546:	83 c4 0c             	add    $0xc,%esp
 549:	6a 14                	push   $0x14
 54b:	53                   	push   %ebx
 54c:	6a 00                	push   $0x0
 54e:	e8 e7 02 00 00       	call   83a <read>
        n = atoi(integerthing);
 553:	89 1c 24             	mov    %ebx,(%esp)
 556:	e8 55 02 00 00       	call   7b0 <atoi>
    switch(n)
 55b:	83 c4 10             	add    $0x10,%esp
 55e:	83 f8 02             	cmp    $0x2,%eax
 561:	74 3d                	je     5a0 <mainMenu+0x70>
 563:	7e 1b                	jle    580 <mainMenu+0x50>
 565:	83 f8 03             	cmp    $0x3,%eax
 568:	75 3d                	jne    5a7 <mainMenu+0x77>
            pointerMenu();
 56a:	e8 81 ff ff ff       	call   4f0 <pointerMenu>
    if(!errorFlag)
 56f:	a1 80 14 00 00       	mov    0x1480,%eax
 574:	85 c0                	test   %eax,%eax
 576:	74 1b                	je     593 <mainMenu+0x63>
}
 578:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 57b:	c9                   	leave  
 57c:	c3                   	ret    
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    switch(n)
 580:	83 f8 01             	cmp    $0x1,%eax
 583:	75 2c                	jne    5b1 <mainMenu+0x81>
            readMenu();
 585:	e8 66 fd ff ff       	call   2f0 <readMenu>
    if(!errorFlag)
 58a:	a1 80 14 00 00       	mov    0x1480,%eax
 58f:	85 c0                	test   %eax,%eax
 591:	75 e5                	jne    578 <mainMenu+0x48>
        mainMenu();
 593:	e8 98 ff ff ff       	call   530 <mainMenu>
}
 598:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 59b:	c9                   	leave  
 59c:	c3                   	ret    
 59d:	8d 76 00             	lea    0x0(%esi),%esi
            writeMenu();
 5a0:	e8 7b fe ff ff       	call   420 <writeMenu>
            break;
 5a5:	eb c8                	jmp    56f <mainMenu+0x3f>
    switch(n)
 5a7:	83 f8 04             	cmp    $0x4,%eax
 5aa:	75 05                	jne    5b1 <mainMenu+0x81>
                exit();
 5ac:	e8 71 02 00 00       	call   822 <exit>
                    printf(1,error);
 5b1:	52                   	push   %edx
 5b2:	52                   	push   %edx
 5b3:	ff 35 7c 14 00 00    	pushl  0x147c
 5b9:	6a 01                	push   $0x1
 5bb:	e8 b0 03 00 00       	call   970 <printf>
                    exit();
 5c0:	e8 5d 02 00 00       	call   822 <exit>
 5c5:	66 90                	xchg   %ax,%ax
 5c7:	66 90                	xchg   %ax,%ax
 5c9:	66 90                	xchg   %ax,%ax
 5cb:	66 90                	xchg   %ax,%ax
 5cd:	66 90                	xchg   %ax,%ax
 5cf:	90                   	nop

000005d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	53                   	push   %ebx
 5d4:	8b 45 08             	mov    0x8(%ebp),%eax
 5d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 5da:	89 c2                	mov    %eax,%edx
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e0:	83 c1 01             	add    $0x1,%ecx
 5e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 5e7:	83 c2 01             	add    $0x1,%edx
 5ea:	84 db                	test   %bl,%bl
 5ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 5ef:	75 ef                	jne    5e0 <strcpy+0x10>
    ;
  return os;
}
 5f1:	5b                   	pop    %ebx
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    
 5f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000600 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	53                   	push   %ebx
 604:	8b 55 08             	mov    0x8(%ebp),%edx
 607:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 60a:	0f b6 02             	movzbl (%edx),%eax
 60d:	0f b6 19             	movzbl (%ecx),%ebx
 610:	84 c0                	test   %al,%al
 612:	75 1c                	jne    630 <strcmp+0x30>
 614:	eb 2a                	jmp    640 <strcmp+0x40>
 616:	8d 76 00             	lea    0x0(%esi),%esi
 619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 620:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 623:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 626:	83 c1 01             	add    $0x1,%ecx
 629:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 62c:	84 c0                	test   %al,%al
 62e:	74 10                	je     640 <strcmp+0x40>
 630:	38 d8                	cmp    %bl,%al
 632:	74 ec                	je     620 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 634:	29 d8                	sub    %ebx,%eax
}
 636:	5b                   	pop    %ebx
 637:	5d                   	pop    %ebp
 638:	c3                   	ret    
 639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 640:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 642:	29 d8                	sub    %ebx,%eax
}
 644:	5b                   	pop    %ebx
 645:	5d                   	pop    %ebp
 646:	c3                   	ret    
 647:	89 f6                	mov    %esi,%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <strlen>:

uint
strlen(const char *s)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 656:	80 39 00             	cmpb   $0x0,(%ecx)
 659:	74 15                	je     670 <strlen+0x20>
 65b:	31 d2                	xor    %edx,%edx
 65d:	8d 76 00             	lea    0x0(%esi),%esi
 660:	83 c2 01             	add    $0x1,%edx
 663:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 667:	89 d0                	mov    %edx,%eax
 669:	75 f5                	jne    660 <strlen+0x10>
    ;
  return n;
}
 66b:	5d                   	pop    %ebp
 66c:	c3                   	ret    
 66d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 670:	31 c0                	xor    %eax,%eax
}
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
 674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 67a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000680 <memset>:

void*
memset(void *dst, int c, uint n)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 687:	8b 4d 10             	mov    0x10(%ebp),%ecx
 68a:	8b 45 0c             	mov    0xc(%ebp),%eax
 68d:	89 d7                	mov    %edx,%edi
 68f:	fc                   	cld    
 690:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 692:	89 d0                	mov    %edx,%eax
 694:	5f                   	pop    %edi
 695:	5d                   	pop    %ebp
 696:	c3                   	ret    
 697:	89 f6                	mov    %esi,%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006a0 <strchr>:

char*
strchr(const char *s, char c)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	53                   	push   %ebx
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 6aa:	0f b6 10             	movzbl (%eax),%edx
 6ad:	84 d2                	test   %dl,%dl
 6af:	74 1d                	je     6ce <strchr+0x2e>
    if(*s == c)
 6b1:	38 d3                	cmp    %dl,%bl
 6b3:	89 d9                	mov    %ebx,%ecx
 6b5:	75 0d                	jne    6c4 <strchr+0x24>
 6b7:	eb 17                	jmp    6d0 <strchr+0x30>
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6c0:	38 ca                	cmp    %cl,%dl
 6c2:	74 0c                	je     6d0 <strchr+0x30>
  for(; *s; s++)
 6c4:	83 c0 01             	add    $0x1,%eax
 6c7:	0f b6 10             	movzbl (%eax),%edx
 6ca:	84 d2                	test   %dl,%dl
 6cc:	75 f2                	jne    6c0 <strchr+0x20>
      return (char*)s;
  return 0;
 6ce:	31 c0                	xor    %eax,%eax
}
 6d0:	5b                   	pop    %ebx
 6d1:	5d                   	pop    %ebp
 6d2:	c3                   	ret    
 6d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006e0 <gets>:

char*
gets(char *buf, int max)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6e6:	31 f6                	xor    %esi,%esi
 6e8:	89 f3                	mov    %esi,%ebx
{
 6ea:	83 ec 1c             	sub    $0x1c,%esp
 6ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 6f0:	eb 2f                	jmp    721 <gets+0x41>
 6f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 6f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6fb:	83 ec 04             	sub    $0x4,%esp
 6fe:	6a 01                	push   $0x1
 700:	50                   	push   %eax
 701:	6a 00                	push   $0x0
 703:	e8 32 01 00 00       	call   83a <read>
    if(cc < 1)
 708:	83 c4 10             	add    $0x10,%esp
 70b:	85 c0                	test   %eax,%eax
 70d:	7e 1c                	jle    72b <gets+0x4b>
      break;
    buf[i++] = c;
 70f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 713:	83 c7 01             	add    $0x1,%edi
 716:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 719:	3c 0a                	cmp    $0xa,%al
 71b:	74 23                	je     740 <gets+0x60>
 71d:	3c 0d                	cmp    $0xd,%al
 71f:	74 1f                	je     740 <gets+0x60>
  for(i=0; i+1 < max; ){
 721:	83 c3 01             	add    $0x1,%ebx
 724:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 727:	89 fe                	mov    %edi,%esi
 729:	7c cd                	jl     6f8 <gets+0x18>
 72b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 730:	c6 03 00             	movb   $0x0,(%ebx)
}
 733:	8d 65 f4             	lea    -0xc(%ebp),%esp
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    
 73b:	90                   	nop
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 740:	8b 75 08             	mov    0x8(%ebp),%esi
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	01 de                	add    %ebx,%esi
 748:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 74a:	c6 03 00             	movb   $0x0,(%ebx)
}
 74d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 750:	5b                   	pop    %ebx
 751:	5e                   	pop    %esi
 752:	5f                   	pop    %edi
 753:	5d                   	pop    %ebp
 754:	c3                   	ret    
 755:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000760 <stat>:

int
stat(const char *n, struct stat *st)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	56                   	push   %esi
 764:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 765:	83 ec 08             	sub    $0x8,%esp
 768:	6a 00                	push   $0x0
 76a:	ff 75 08             	pushl  0x8(%ebp)
 76d:	e8 f0 00 00 00       	call   862 <open>
  if(fd < 0)
 772:	83 c4 10             	add    $0x10,%esp
 775:	85 c0                	test   %eax,%eax
 777:	78 27                	js     7a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 779:	83 ec 08             	sub    $0x8,%esp
 77c:	ff 75 0c             	pushl  0xc(%ebp)
 77f:	89 c3                	mov    %eax,%ebx
 781:	50                   	push   %eax
 782:	e8 f3 00 00 00       	call   87a <fstat>
  close(fd);
 787:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 78a:	89 c6                	mov    %eax,%esi
  close(fd);
 78c:	e8 b9 00 00 00       	call   84a <close>
  return r;
 791:	83 c4 10             	add    $0x10,%esp
}
 794:	8d 65 f8             	lea    -0x8(%ebp),%esp
 797:	89 f0                	mov    %esi,%eax
 799:	5b                   	pop    %ebx
 79a:	5e                   	pop    %esi
 79b:	5d                   	pop    %ebp
 79c:	c3                   	ret    
 79d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 7a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 7a5:	eb ed                	jmp    794 <stat+0x34>
 7a7:	89 f6                	mov    %esi,%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007b0 <atoi>:

int
atoi(const char *s)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	53                   	push   %ebx
 7b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 7b7:	0f be 11             	movsbl (%ecx),%edx
 7ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 7bd:	3c 09                	cmp    $0x9,%al
  n = 0;
 7bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 7c4:	77 1f                	ja     7e5 <atoi+0x35>
 7c6:	8d 76 00             	lea    0x0(%esi),%esi
 7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 7d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 7d3:	83 c1 01             	add    $0x1,%ecx
 7d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 7da:	0f be 11             	movsbl (%ecx),%edx
 7dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 7e0:	80 fb 09             	cmp    $0x9,%bl
 7e3:	76 eb                	jbe    7d0 <atoi+0x20>
  return n;
}
 7e5:	5b                   	pop    %ebx
 7e6:	5d                   	pop    %ebp
 7e7:	c3                   	ret    
 7e8:	90                   	nop
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	56                   	push   %esi
 7f4:	53                   	push   %ebx
 7f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7f8:	8b 45 08             	mov    0x8(%ebp),%eax
 7fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 7fe:	85 db                	test   %ebx,%ebx
 800:	7e 14                	jle    816 <memmove+0x26>
 802:	31 d2                	xor    %edx,%edx
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 808:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 80c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 80f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 812:	39 d3                	cmp    %edx,%ebx
 814:	75 f2                	jne    808 <memmove+0x18>
  return vdst;
}
 816:	5b                   	pop    %ebx
 817:	5e                   	pop    %esi
 818:	5d                   	pop    %ebp
 819:	c3                   	ret    

0000081a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 81a:	b8 01 00 00 00       	mov    $0x1,%eax
 81f:	cd 40                	int    $0x40
 821:	c3                   	ret    

00000822 <exit>:
SYSCALL(exit)
 822:	b8 02 00 00 00       	mov    $0x2,%eax
 827:	cd 40                	int    $0x40
 829:	c3                   	ret    

0000082a <wait>:
SYSCALL(wait)
 82a:	b8 03 00 00 00       	mov    $0x3,%eax
 82f:	cd 40                	int    $0x40
 831:	c3                   	ret    

00000832 <pipe>:
SYSCALL(pipe)
 832:	b8 04 00 00 00       	mov    $0x4,%eax
 837:	cd 40                	int    $0x40
 839:	c3                   	ret    

0000083a <read>:
SYSCALL(read)
 83a:	b8 05 00 00 00       	mov    $0x5,%eax
 83f:	cd 40                	int    $0x40
 841:	c3                   	ret    

00000842 <write>:
SYSCALL(write)
 842:	b8 10 00 00 00       	mov    $0x10,%eax
 847:	cd 40                	int    $0x40
 849:	c3                   	ret    

0000084a <close>:
SYSCALL(close)
 84a:	b8 15 00 00 00       	mov    $0x15,%eax
 84f:	cd 40                	int    $0x40
 851:	c3                   	ret    

00000852 <kill>:
SYSCALL(kill)
 852:	b8 06 00 00 00       	mov    $0x6,%eax
 857:	cd 40                	int    $0x40
 859:	c3                   	ret    

0000085a <exec>:
SYSCALL(exec)
 85a:	b8 07 00 00 00       	mov    $0x7,%eax
 85f:	cd 40                	int    $0x40
 861:	c3                   	ret    

00000862 <open>:
SYSCALL(open)
 862:	b8 0f 00 00 00       	mov    $0xf,%eax
 867:	cd 40                	int    $0x40
 869:	c3                   	ret    

0000086a <mknod>:
SYSCALL(mknod)
 86a:	b8 11 00 00 00       	mov    $0x11,%eax
 86f:	cd 40                	int    $0x40
 871:	c3                   	ret    

00000872 <unlink>:
SYSCALL(unlink)
 872:	b8 12 00 00 00       	mov    $0x12,%eax
 877:	cd 40                	int    $0x40
 879:	c3                   	ret    

0000087a <fstat>:
SYSCALL(fstat)
 87a:	b8 08 00 00 00       	mov    $0x8,%eax
 87f:	cd 40                	int    $0x40
 881:	c3                   	ret    

00000882 <link>:
SYSCALL(link)
 882:	b8 13 00 00 00       	mov    $0x13,%eax
 887:	cd 40                	int    $0x40
 889:	c3                   	ret    

0000088a <mkdir>:
SYSCALL(mkdir)
 88a:	b8 14 00 00 00       	mov    $0x14,%eax
 88f:	cd 40                	int    $0x40
 891:	c3                   	ret    

00000892 <chdir>:
SYSCALL(chdir)
 892:	b8 09 00 00 00       	mov    $0x9,%eax
 897:	cd 40                	int    $0x40
 899:	c3                   	ret    

0000089a <dup>:
SYSCALL(dup)
 89a:	b8 0a 00 00 00       	mov    $0xa,%eax
 89f:	cd 40                	int    $0x40
 8a1:	c3                   	ret    

000008a2 <getpid>:
SYSCALL(getpid)
 8a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 8a7:	cd 40                	int    $0x40
 8a9:	c3                   	ret    

000008aa <sbrk>:
SYSCALL(sbrk)
 8aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 8af:	cd 40                	int    $0x40
 8b1:	c3                   	ret    

000008b2 <sleep>:
SYSCALL(sleep)
 8b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 8b7:	cd 40                	int    $0x40
 8b9:	c3                   	ret    

000008ba <uptime>:
SYSCALL(uptime)
 8ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 8bf:	cd 40                	int    $0x40
 8c1:	c3                   	ret    

000008c2 <setpriority>:
SYSCALL(setpriority)
 8c2:	b8 16 00 00 00       	mov    $0x16,%eax
 8c7:	cd 40                	int    $0x40
 8c9:	c3                   	ret    
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 8d9:	85 d2                	test   %edx,%edx
{
 8db:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 8de:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 8e0:	79 76                	jns    958 <printint+0x88>
 8e2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 8e6:	74 70                	je     958 <printint+0x88>
    x = -xx;
 8e8:	f7 d8                	neg    %eax
    neg = 1;
 8ea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 8f1:	31 f6                	xor    %esi,%esi
 8f3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 8f6:	eb 0a                	jmp    902 <printint+0x32>
 8f8:	90                   	nop
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 900:	89 fe                	mov    %edi,%esi
 902:	31 d2                	xor    %edx,%edx
 904:	8d 7e 01             	lea    0x1(%esi),%edi
 907:	f7 f1                	div    %ecx
 909:	0f b6 92 d8 0f 00 00 	movzbl 0xfd8(%edx),%edx
  }while((x /= base) != 0);
 910:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 912:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 915:	75 e9                	jne    900 <printint+0x30>
  if(neg)
 917:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 91a:	85 c0                	test   %eax,%eax
 91c:	74 08                	je     926 <printint+0x56>
    buf[i++] = '-';
 91e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 923:	8d 7e 02             	lea    0x2(%esi),%edi
 926:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 92a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 92d:	8d 76 00             	lea    0x0(%esi),%esi
 930:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 933:	83 ec 04             	sub    $0x4,%esp
 936:	83 ee 01             	sub    $0x1,%esi
 939:	6a 01                	push   $0x1
 93b:	53                   	push   %ebx
 93c:	57                   	push   %edi
 93d:	88 45 d7             	mov    %al,-0x29(%ebp)
 940:	e8 fd fe ff ff       	call   842 <write>

  while(--i >= 0)
 945:	83 c4 10             	add    $0x10,%esp
 948:	39 de                	cmp    %ebx,%esi
 94a:	75 e4                	jne    930 <printint+0x60>
    putc(fd, buf[i]);
}
 94c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 94f:	5b                   	pop    %ebx
 950:	5e                   	pop    %esi
 951:	5f                   	pop    %edi
 952:	5d                   	pop    %ebp
 953:	c3                   	ret    
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 958:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 95f:	eb 90                	jmp    8f1 <printint+0x21>
 961:	eb 0d                	jmp    970 <printf>
 963:	90                   	nop
 964:	90                   	nop
 965:	90                   	nop
 966:	90                   	nop
 967:	90                   	nop
 968:	90                   	nop
 969:	90                   	nop
 96a:	90                   	nop
 96b:	90                   	nop
 96c:	90                   	nop
 96d:	90                   	nop
 96e:	90                   	nop
 96f:	90                   	nop

00000970 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	57                   	push   %edi
 974:	56                   	push   %esi
 975:	53                   	push   %ebx
 976:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 979:	8b 75 0c             	mov    0xc(%ebp),%esi
 97c:	0f b6 1e             	movzbl (%esi),%ebx
 97f:	84 db                	test   %bl,%bl
 981:	0f 84 b3 00 00 00    	je     a3a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 987:	8d 45 10             	lea    0x10(%ebp),%eax
 98a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 98d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 98f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 992:	eb 2f                	jmp    9c3 <printf+0x53>
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 998:	83 f8 25             	cmp    $0x25,%eax
 99b:	0f 84 a7 00 00 00    	je     a48 <printf+0xd8>
  write(fd, &c, 1);
 9a1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 9a4:	83 ec 04             	sub    $0x4,%esp
 9a7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 9aa:	6a 01                	push   $0x1
 9ac:	50                   	push   %eax
 9ad:	ff 75 08             	pushl  0x8(%ebp)
 9b0:	e8 8d fe ff ff       	call   842 <write>
 9b5:	83 c4 10             	add    $0x10,%esp
 9b8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 9bb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 9bf:	84 db                	test   %bl,%bl
 9c1:	74 77                	je     a3a <printf+0xca>
    if(state == 0){
 9c3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 9c5:	0f be cb             	movsbl %bl,%ecx
 9c8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9cb:	74 cb                	je     998 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9cd:	83 ff 25             	cmp    $0x25,%edi
 9d0:	75 e6                	jne    9b8 <printf+0x48>
      if(c == 'd'){
 9d2:	83 f8 64             	cmp    $0x64,%eax
 9d5:	0f 84 05 01 00 00    	je     ae0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 9e1:	83 f9 70             	cmp    $0x70,%ecx
 9e4:	74 72                	je     a58 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9e6:	83 f8 73             	cmp    $0x73,%eax
 9e9:	0f 84 99 00 00 00    	je     a88 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ef:	83 f8 63             	cmp    $0x63,%eax
 9f2:	0f 84 08 01 00 00    	je     b00 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9f8:	83 f8 25             	cmp    $0x25,%eax
 9fb:	0f 84 ef 00 00 00    	je     af0 <printf+0x180>
  write(fd, &c, 1);
 a01:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a04:	83 ec 04             	sub    $0x4,%esp
 a07:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a0b:	6a 01                	push   $0x1
 a0d:	50                   	push   %eax
 a0e:	ff 75 08             	pushl  0x8(%ebp)
 a11:	e8 2c fe ff ff       	call   842 <write>
 a16:	83 c4 0c             	add    $0xc,%esp
 a19:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 a1c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 a1f:	6a 01                	push   $0x1
 a21:	50                   	push   %eax
 a22:	ff 75 08             	pushl  0x8(%ebp)
 a25:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a28:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 a2a:	e8 13 fe ff ff       	call   842 <write>
  for(i = 0; fmt[i]; i++){
 a2f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 a33:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a36:	84 db                	test   %bl,%bl
 a38:	75 89                	jne    9c3 <printf+0x53>
    }
  }
}
 a3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a3d:	5b                   	pop    %ebx
 a3e:	5e                   	pop    %esi
 a3f:	5f                   	pop    %edi
 a40:	5d                   	pop    %ebp
 a41:	c3                   	ret    
 a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 a48:	bf 25 00 00 00       	mov    $0x25,%edi
 a4d:	e9 66 ff ff ff       	jmp    9b8 <printf+0x48>
 a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 a58:	83 ec 0c             	sub    $0xc,%esp
 a5b:	b9 10 00 00 00       	mov    $0x10,%ecx
 a60:	6a 00                	push   $0x0
 a62:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 a65:	8b 45 08             	mov    0x8(%ebp),%eax
 a68:	8b 17                	mov    (%edi),%edx
 a6a:	e8 61 fe ff ff       	call   8d0 <printint>
        ap++;
 a6f:	89 f8                	mov    %edi,%eax
 a71:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a74:	31 ff                	xor    %edi,%edi
        ap++;
 a76:	83 c0 04             	add    $0x4,%eax
 a79:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 a7c:	e9 37 ff ff ff       	jmp    9b8 <printf+0x48>
 a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 a88:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a8b:	8b 08                	mov    (%eax),%ecx
        ap++;
 a8d:	83 c0 04             	add    $0x4,%eax
 a90:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 a93:	85 c9                	test   %ecx,%ecx
 a95:	0f 84 8e 00 00 00    	je     b29 <printf+0x1b9>
        while(*s != 0){
 a9b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 a9e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 aa0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 aa2:	84 c0                	test   %al,%al
 aa4:	0f 84 0e ff ff ff    	je     9b8 <printf+0x48>
 aaa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 aad:	89 de                	mov    %ebx,%esi
 aaf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ab2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 ab5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 ab8:	83 ec 04             	sub    $0x4,%esp
          s++;
 abb:	83 c6 01             	add    $0x1,%esi
 abe:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 ac1:	6a 01                	push   $0x1
 ac3:	57                   	push   %edi
 ac4:	53                   	push   %ebx
 ac5:	e8 78 fd ff ff       	call   842 <write>
        while(*s != 0){
 aca:	0f b6 06             	movzbl (%esi),%eax
 acd:	83 c4 10             	add    $0x10,%esp
 ad0:	84 c0                	test   %al,%al
 ad2:	75 e4                	jne    ab8 <printf+0x148>
 ad4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 ad7:	31 ff                	xor    %edi,%edi
 ad9:	e9 da fe ff ff       	jmp    9b8 <printf+0x48>
 ade:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 ae0:	83 ec 0c             	sub    $0xc,%esp
 ae3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 ae8:	6a 01                	push   $0x1
 aea:	e9 73 ff ff ff       	jmp    a62 <printf+0xf2>
 aef:	90                   	nop
  write(fd, &c, 1);
 af0:	83 ec 04             	sub    $0x4,%esp
 af3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 af6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 af9:	6a 01                	push   $0x1
 afb:	e9 21 ff ff ff       	jmp    a21 <printf+0xb1>
        putc(fd, *ap);
 b00:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 b03:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b06:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 b08:	6a 01                	push   $0x1
        ap++;
 b0a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 b0d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 b10:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 b13:	50                   	push   %eax
 b14:	ff 75 08             	pushl  0x8(%ebp)
 b17:	e8 26 fd ff ff       	call   842 <write>
        ap++;
 b1c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 b1f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b22:	31 ff                	xor    %edi,%edi
 b24:	e9 8f fe ff ff       	jmp    9b8 <printf+0x48>
          s = "(null)";
 b29:	bb d1 0f 00 00       	mov    $0xfd1,%ebx
        while(*s != 0){
 b2e:	b8 28 00 00 00       	mov    $0x28,%eax
 b33:	e9 72 ff ff ff       	jmp    aaa <printf+0x13a>
 b38:	66 90                	xchg   %ax,%ax
 b3a:	66 90                	xchg   %ax,%ax
 b3c:	66 90                	xchg   %ax,%ax
 b3e:	66 90                	xchg   %ax,%ax

00000b40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b41:	a1 84 14 00 00       	mov    0x1484,%eax
{
 b46:	89 e5                	mov    %esp,%ebp
 b48:	57                   	push   %edi
 b49:	56                   	push   %esi
 b4a:	53                   	push   %ebx
 b4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 b4e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b58:	39 c8                	cmp    %ecx,%eax
 b5a:	8b 10                	mov    (%eax),%edx
 b5c:	73 32                	jae    b90 <free+0x50>
 b5e:	39 d1                	cmp    %edx,%ecx
 b60:	72 04                	jb     b66 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b62:	39 d0                	cmp    %edx,%eax
 b64:	72 32                	jb     b98 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b66:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b69:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b6c:	39 fa                	cmp    %edi,%edx
 b6e:	74 30                	je     ba0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b70:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b73:	8b 50 04             	mov    0x4(%eax),%edx
 b76:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b79:	39 f1                	cmp    %esi,%ecx
 b7b:	74 3a                	je     bb7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b7d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 b7f:	a3 84 14 00 00       	mov    %eax,0x1484
}
 b84:	5b                   	pop    %ebx
 b85:	5e                   	pop    %esi
 b86:	5f                   	pop    %edi
 b87:	5d                   	pop    %ebp
 b88:	c3                   	ret    
 b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b90:	39 d0                	cmp    %edx,%eax
 b92:	72 04                	jb     b98 <free+0x58>
 b94:	39 d1                	cmp    %edx,%ecx
 b96:	72 ce                	jb     b66 <free+0x26>
{
 b98:	89 d0                	mov    %edx,%eax
 b9a:	eb bc                	jmp    b58 <free+0x18>
 b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 ba0:	03 72 04             	add    0x4(%edx),%esi
 ba3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ba6:	8b 10                	mov    (%eax),%edx
 ba8:	8b 12                	mov    (%edx),%edx
 baa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bad:	8b 50 04             	mov    0x4(%eax),%edx
 bb0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bb3:	39 f1                	cmp    %esi,%ecx
 bb5:	75 c6                	jne    b7d <free+0x3d>
    p->s.size += bp->s.size;
 bb7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 bba:	a3 84 14 00 00       	mov    %eax,0x1484
    p->s.size += bp->s.size;
 bbf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 bc2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 bc5:	89 10                	mov    %edx,(%eax)
}
 bc7:	5b                   	pop    %ebx
 bc8:	5e                   	pop    %esi
 bc9:	5f                   	pop    %edi
 bca:	5d                   	pop    %ebp
 bcb:	c3                   	ret    
 bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	57                   	push   %edi
 bd4:	56                   	push   %esi
 bd5:	53                   	push   %ebx
 bd6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bdc:	8b 15 84 14 00 00    	mov    0x1484,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 be2:	8d 78 07             	lea    0x7(%eax),%edi
 be5:	c1 ef 03             	shr    $0x3,%edi
 be8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 beb:	85 d2                	test   %edx,%edx
 bed:	0f 84 9d 00 00 00    	je     c90 <malloc+0xc0>
 bf3:	8b 02                	mov    (%edx),%eax
 bf5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bf8:	39 cf                	cmp    %ecx,%edi
 bfa:	76 6c                	jbe    c68 <malloc+0x98>
 bfc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 c02:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c07:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 c0a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 c11:	eb 0e                	jmp    c21 <malloc+0x51>
 c13:	90                   	nop
 c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c18:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c1a:	8b 48 04             	mov    0x4(%eax),%ecx
 c1d:	39 f9                	cmp    %edi,%ecx
 c1f:	73 47                	jae    c68 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c21:	39 05 84 14 00 00    	cmp    %eax,0x1484
 c27:	89 c2                	mov    %eax,%edx
 c29:	75 ed                	jne    c18 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 c2b:	83 ec 0c             	sub    $0xc,%esp
 c2e:	56                   	push   %esi
 c2f:	e8 76 fc ff ff       	call   8aa <sbrk>
  if(p == (char*)-1)
 c34:	83 c4 10             	add    $0x10,%esp
 c37:	83 f8 ff             	cmp    $0xffffffff,%eax
 c3a:	74 1c                	je     c58 <malloc+0x88>
  hp->s.size = nu;
 c3c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c3f:	83 ec 0c             	sub    $0xc,%esp
 c42:	83 c0 08             	add    $0x8,%eax
 c45:	50                   	push   %eax
 c46:	e8 f5 fe ff ff       	call   b40 <free>
  return freep;
 c4b:	8b 15 84 14 00 00    	mov    0x1484,%edx
      if((p = morecore(nunits)) == 0)
 c51:	83 c4 10             	add    $0x10,%esp
 c54:	85 d2                	test   %edx,%edx
 c56:	75 c0                	jne    c18 <malloc+0x48>
        return 0;
  }
}
 c58:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c5b:	31 c0                	xor    %eax,%eax
}
 c5d:	5b                   	pop    %ebx
 c5e:	5e                   	pop    %esi
 c5f:	5f                   	pop    %edi
 c60:	5d                   	pop    %ebp
 c61:	c3                   	ret    
 c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 c68:	39 cf                	cmp    %ecx,%edi
 c6a:	74 54                	je     cc0 <malloc+0xf0>
        p->s.size -= nunits;
 c6c:	29 f9                	sub    %edi,%ecx
 c6e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 c71:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 c74:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 c77:	89 15 84 14 00 00    	mov    %edx,0x1484
}
 c7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c80:	83 c0 08             	add    $0x8,%eax
}
 c83:	5b                   	pop    %ebx
 c84:	5e                   	pop    %esi
 c85:	5f                   	pop    %edi
 c86:	5d                   	pop    %ebp
 c87:	c3                   	ret    
 c88:	90                   	nop
 c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 c90:	c7 05 84 14 00 00 88 	movl   $0x1488,0x1484
 c97:	14 00 00 
 c9a:	c7 05 88 14 00 00 88 	movl   $0x1488,0x1488
 ca1:	14 00 00 
    base.s.size = 0;
 ca4:	b8 88 14 00 00       	mov    $0x1488,%eax
 ca9:	c7 05 8c 14 00 00 00 	movl   $0x0,0x148c
 cb0:	00 00 00 
 cb3:	e9 44 ff ff ff       	jmp    bfc <malloc+0x2c>
 cb8:	90                   	nop
 cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 cc0:	8b 08                	mov    (%eax),%ecx
 cc2:	89 0a                	mov    %ecx,(%edx)
 cc4:	eb b1                	jmp    c77 <malloc+0xa7>
