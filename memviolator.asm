
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
    address[0] = (char *)4294967040;
    address[1] = (char *)0;
    address[2] = (char *)&main;
    address[3] = (char *)&_end;
    address[4] = (char *)&ptr;
    address[5] = (char *)&argv;
   e:	83 c1 04             	add    $0x4,%ecx
{
  11:	83 ec 10             	sub    $0x10,%esp
    * p = 0;
  14:	a1 c8 14 00 00       	mov    0x14c8,%eax
  19:	c6 00 00             	movb   $0x0,(%eax)
    ptr = malloc(1);
  1c:	6a 01                	push   $0x1
    address[5] = (char *)&argv;
  1e:	89 0d e4 14 00 00    	mov    %ecx,0x14e4
    address[0] = (char *)4294967040;
  24:	c7 05 d0 14 00 00 00 	movl   $0xffffff00,0x14d0
  2b:	ff ff ff 
    address[1] = (char *)0;
  2e:	c7 05 d4 14 00 00 00 	movl   $0x0,0x14d4
  35:	00 00 00 
    address[2] = (char *)&main;
  38:	c7 05 d8 14 00 00 00 	movl   $0x0,0x14d8
  3f:	00 00 00 
    address[3] = (char *)&_end;
  42:	c7 05 dc 14 00 00 f4 	movl   $0x14f4,0x14dc
  49:	14 00 00 
    address[4] = (char *)&ptr;
  4c:	c7 05 e0 14 00 00 e8 	movl   $0x14e8,0x14e0
  53:	14 00 00 
    ptr = malloc(1);
  56:	e8 95 0b 00 00       	call   bf0 <malloc>
  5b:	a3 e8 14 00 00       	mov    %eax,0x14e8
    mainMenu();
  60:	e8 eb 04 00 00       	call   550 <mainMenu>
    free(ptr);
  65:	58                   	pop    %eax
  66:	ff 35 e8 14 00 00    	pushl  0x14e8
  6c:	e8 ef 0a 00 00       	call   b60 <free>
    #ifdef __pie__
        return 0;
    #else
        exit();
  71:	e8 cc 07 00 00       	call   842 <exit>
  76:	66 90                	xchg   %ax,%ax
  78:	66 90                	xchg   %ax,%ax
  7a:	66 90                	xchg   %ax,%ax
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <setPointer.part.0>:
void setPointer(int location)
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
            read(0, in, sizeof(in));
  84:	8d 5d d0             	lea    -0x30(%ebp),%ebx
void setPointer(int location)
  87:	83 ec 3c             	sub    $0x3c,%esp
            printf(1, "Enter your custom address value:\n");
  8a:	68 e8 0c 00 00       	push   $0xce8
  8f:	6a 01                	push   $0x1
  91:	e8 fa 08 00 00       	call   990 <printf>
            read(0, in, sizeof(in));
  96:	83 c4 0c             	add    $0xc,%esp
  99:	6a 28                	push   $0x28
  9b:	53                   	push   %ebx
  9c:	6a 00                	push   $0x0
  9e:	e8 b7 07 00 00       	call   85a <read>
            temp = atoi(in);
  a3:	89 1c 24             	mov    %ebx,(%esp)
  a6:	e8 25 07 00 00       	call   7d0 <atoi>
        printf(1, "Operation completed! The pointer is currently at: %p",p);
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	ff 35 c8 14 00 00    	pushl  0x14c8
  b4:	68 0c 0d 00 00       	push   $0xd0c
  b9:	6a 01                	push   $0x1
  bb:	e8 d0 08 00 00       	call   990 <printf>
  c0:	83 c4 10             	add    $0x10,%esp
}
  c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c6:	c9                   	leave  
  c7:	c3                   	ret    
  c8:	90                   	nop
  c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000d0 <setPointerE.part.1>:
void setPointerE(int location)
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
            read(0, in, sizeof(in));
  d4:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
void setPointerE(int location)
  d7:	83 ec 2c             	sub    $0x2c,%esp
            printf(1, "Enter your custom address value:\n");
  da:	68 e8 0c 00 00       	push   $0xce8
  df:	6a 01                	push   $0x1
  e1:	e8 aa 08 00 00       	call   990 <printf>
            read(0, in, sizeof(in));
  e6:	83 c4 0c             	add    $0xc,%esp
  e9:	6a 14                	push   $0x14
  eb:	53                   	push   %ebx
  ec:	6a 00                	push   $0x0
  ee:	e8 67 07 00 00       	call   85a <read>
            temp = atoi(in);
  f3:	89 1c 24             	mov    %ebx,(%esp)
  f6:	e8 d5 06 00 00       	call   7d0 <atoi>
        *end = temp;
  fb:	8b 15 ec 14 00 00    	mov    0x14ec,%edx
 101:	83 c4 10             	add    $0x10,%esp
 104:	88 02                	mov    %al,(%edx)
}
 106:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 109:	c9                   	leave  
 10a:	c3                   	ret    
 10b:	90                   	nop
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000110 <printCompletion>:
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	83 ec 0c             	sub    $0xc,%esp
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 116:	ff 35 c8 14 00 00    	pushl  0x14c8
 11c:	68 0c 0d 00 00       	push   $0xd0c
 121:	6a 01                	push   $0x1
 123:	e8 68 08 00 00       	call   990 <printf>
}
 128:	83 c4 10             	add    $0x10,%esp
 12b:	c9                   	leave  
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memoryViolatorR>:
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	56                   	push   %esi
 134:	53                   	push   %ebx
 135:	be 10 00 00 00       	mov    $0x10,%esi
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            printf(1, "%p: ", p);
 140:	83 ec 04             	sub    $0x4,%esp
 143:	ff 35 c8 14 00 00    	pushl  0x14c8
 149:	bb 10 00 00 00       	mov    $0x10,%ebx
 14e:	68 c4 0f 00 00       	push   $0xfc4
 153:	6a 01                	push   $0x1
 155:	e8 36 08 00 00       	call   990 <printf>
 15a:	a1 c8 14 00 00       	mov    0x14c8,%eax
 15f:	83 c4 10             	add    $0x10,%esp
 162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1, "%x", *p);
 168:	0f be 00             	movsbl (%eax),%eax
 16b:	83 ec 04             	sub    $0x4,%esp
 16e:	50                   	push   %eax
 16f:	68 c9 0f 00 00       	push   $0xfc9
 174:	6a 01                	push   $0x1
 176:	e8 15 08 00 00       	call   990 <printf>
            p++;
 17b:	a1 c8 14 00 00       	mov    0x14c8,%eax
        for(i = 0; i < 16; i++)
 180:	83 c4 10             	add    $0x10,%esp
            p++;
 183:	83 c0 01             	add    $0x1,%eax
        for(i = 0; i < 16; i++)
 186:	83 eb 01             	sub    $0x1,%ebx
            p++;
 189:	a3 c8 14 00 00       	mov    %eax,0x14c8
        for(i = 0; i < 16; i++)
 18e:	75 d8                	jne    168 <memoryViolatorR+0x38>
            printf(1, "\n");
 190:	83 ec 08             	sub    $0x8,%esp
 193:	68 d4 0f 00 00       	push   $0xfd4
 198:	6a 01                	push   $0x1
 19a:	e8 f1 07 00 00       	call   990 <printf>
    for(j = 0; j < 16; j++)
 19f:	83 c4 10             	add    $0x10,%esp
 1a2:	83 ee 01             	sub    $0x1,%esi
 1a5:	75 99                	jne    140 <memoryViolatorR+0x10>
}
 1a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <setPointer>:
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
    if(location < 0 )
 1b6:	85 c0                	test   %eax,%eax
 1b8:	78 0e                	js     1c8 <setPointer+0x18>
        p = (char *)((long) temp);
 1ba:	a3 c8 14 00 00       	mov    %eax,0x14c8
}
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	5d                   	pop    %ebp
 1c9:	e9 b2 fe ff ff       	jmp    80 <setPointer.part.0>
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <setPointerE>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
    if(location < 0)
 1d6:	85 c0                	test   %eax,%eax
 1d8:	78 0e                	js     1e8 <setPointerE+0x18>
        *end = location;
 1da:	8b 15 ec 14 00 00    	mov    0x14ec,%edx
 1e0:	88 02                	mov    %al,(%edx)
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e8:	5d                   	pop    %ebp
 1e9:	e9 e2 fe ff ff       	jmp    d0 <setPointerE.part.1>
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <readCurr>:
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	83 ec 0c             	sub    $0xc,%esp
        printf(1, "%x: ", p);
 1f6:	ff 35 c8 14 00 00    	pushl  0x14c8
 1fc:	68 cc 0f 00 00       	push   $0xfcc
 201:	6a 01                	push   $0x1
 203:	e8 88 07 00 00       	call   990 <printf>
        printf(1, "%x \n", *p);
 208:	a1 c8 14 00 00       	mov    0x14c8,%eax
 20d:	83 c4 0c             	add    $0xc,%esp
 210:	0f be 00             	movsbl (%eax),%eax
 213:	50                   	push   %eax
 214:	68 d1 0f 00 00       	push   $0xfd1
 219:	6a 01                	push   $0x1
 21b:	e8 70 07 00 00       	call   990 <printf>
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
 236:	a1 c8 14 00 00       	mov    0x14c8,%eax
 23b:	03 45 08             	add    0x8(%ebp),%eax
        printf(1, "Pointer is now set to %p.\n", p);
 23e:	50                   	push   %eax
 23f:	68 d6 0f 00 00       	push   $0xfd6
 244:	6a 01                	push   $0x1
    p += amount;
 246:	a3 c8 14 00 00       	mov    %eax,0x14c8
        printf(1, "Pointer is now set to %p.\n", p);
 24b:	e8 40 07 00 00       	call   990 <printf>
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 250:	83 c4 0c             	add    $0xc,%esp
 253:	ff 35 c8 14 00 00    	pushl  0x14c8
 259:	68 0c 0d 00 00       	push   $0xd0c
 25e:	6a 01                	push   $0x1
 260:	e8 2b 07 00 00       	call   990 <printf>
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
 276:	a1 c8 14 00 00       	mov    0x14c8,%eax
 27b:	39 05 ec 14 00 00    	cmp    %eax,0x14ec
 281:	74 24                	je     2a7 <memoryViolatorW+0x37>
 283:	0f b6 55 08          	movzbl 0x8(%ebp),%edx
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        *p = value;
 290:	88 10                	mov    %dl,(%eax)
        p++;
 292:	a1 c8 14 00 00       	mov    0x14c8,%eax
 297:	83 c0 01             	add    $0x1,%eax
    while(p != end)
 29a:	3b 05 ec 14 00 00    	cmp    0x14ec,%eax
        p++;
 2a0:	a3 c8 14 00 00       	mov    %eax,0x14c8
    while(p != end)
 2a5:	75 e9                	jne    290 <memoryViolatorW+0x20>
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 2a7:	83 ec 04             	sub    $0x4,%esp
 2aa:	50                   	push   %eax
 2ab:	68 0c 0d 00 00       	push   $0xd0c
 2b0:	6a 01                	push   $0x1
 2b2:	e8 d9 06 00 00       	call   990 <printf>
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
 2c6:	a1 c8 14 00 00       	mov    0x14c8,%eax
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
 2ce:	88 10                	mov    %dl,(%eax)
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 2d0:	ff 35 c8 14 00 00    	pushl  0x14c8
 2d6:	68 0c 0d 00 00       	push   $0xd0c
 2db:	6a 01                	push   $0x1
 2dd:	e8 ae 06 00 00       	call   990 <printf>
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
 300:	68 44 0d 00 00       	push   $0xd44
 305:	6a 01                	push   $0x1
 307:	e8 84 06 00 00       	call   990 <printf>
        read(0,integerthing, sizeof(integerthing));
 30c:	83 c4 0c             	add    $0xc,%esp
 30f:	6a 14                	push   $0x14
 311:	53                   	push   %ebx
 312:	6a 00                	push   $0x0
 314:	e8 41 05 00 00       	call   85a <read>
        n = atoi(integerthing);
 319:	89 1c 24             	mov    %ebx,(%esp)
 31c:	e8 af 04 00 00       	call   7d0 <atoi>
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
 397:	7e 57                	jle    3f0 <readMenu+0x100>
 399:	83 f8 02             	cmp    $0x2,%eax
 39c:	74 12                	je     3b0 <readMenu+0xc0>
 39e:	83 f8 03             	cmp    $0x3,%eax
 3a1:	75 51                	jne    3f4 <readMenu+0x104>
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
 3bc:	e8 cf 05 00 00       	call   990 <printf>
                read(0,tmp, sizeof(integerthing));
 3c1:	83 c4 0c             	add    $0xc,%esp
 3c4:	68 c8 00 00 00       	push   $0xc8
 3c9:	53                   	push   %ebx
 3ca:	6a 00                	push   $0x0
 3cc:	e8 89 04 00 00       	call   85a <read>
                n = atoi(integerthing);
 3d1:	8d 85 30 ff ff ff    	lea    -0xd0(%ebp),%eax
 3d7:	89 04 24             	mov    %eax,(%esp)
 3da:	e8 f1 03 00 00       	call   7d0 <atoi>
    if(location < 0 )
 3df:	83 c4 10             	add    $0x10,%esp
 3e2:	85 c0                	test   %eax,%eax
 3e4:	78 3a                	js     420 <readMenu+0x130>
        p = (char *)((long) temp);
 3e6:	a3 c8 14 00 00       	mov    %eax,0x14c8
 3eb:	eb b6                	jmp    3a3 <readMenu+0xb3>
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    switch(n)
 3f0:	85 c0                	test   %eax,%eax
 3f2:	74 b4                	je     3a8 <readMenu+0xb8>
                    printf(1,error);
 3f4:	50                   	push   %eax
 3f5:	50                   	push   %eax
 3f6:	ff 35 b4 14 00 00    	pushl  0x14b4
 3fc:	6a 01                	push   $0x1
 3fe:	e8 8d 05 00 00       	call   990 <printf>
                    exit();
 403:	e8 3a 04 00 00       	call   842 <exit>
 408:	90                   	nop
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            memoryViolatorR();
 410:	e8 1b fd ff ff       	call   130 <memoryViolatorR>
}
 415:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 418:	c9                   	leave  
 419:	c3                   	ret    
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 420:	e8 5b fc ff ff       	call   80 <setPointer.part.0>
 425:	e9 79 ff ff ff       	jmp    3a3 <readMenu+0xb3>
 42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000430 <writeMenu>:
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
        read(0,integerthing, sizeof(integerthing));
 434:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
{
 437:	83 ec 2c             	sub    $0x2c,%esp
        printf(1,menuString);
 43a:	68 e0 0d 00 00       	push   $0xde0
 43f:	6a 01                	push   $0x1
 441:	e8 4a 05 00 00       	call   990 <printf>
        read(0,integerthing, sizeof(integerthing));
 446:	83 c4 0c             	add    $0xc,%esp
 449:	6a 14                	push   $0x14
 44b:	53                   	push   %ebx
 44c:	6a 00                	push   $0x0
 44e:	e8 07 04 00 00       	call   85a <read>
        n = atoi(integerthing);
 453:	89 1c 24             	mov    %ebx,(%esp)
 456:	e8 75 03 00 00       	call   7d0 <atoi>
    switch(n)
 45b:	83 c4 10             	add    $0x10,%esp
 45e:	83 f8 01             	cmp    $0x1,%eax
 461:	74 5d                	je     4c0 <writeMenu+0x90>
 463:	7e 7b                	jle    4e0 <writeMenu+0xb0>
 465:	83 f8 02             	cmp    $0x2,%eax
 468:	74 36                	je     4a0 <writeMenu+0x70>
 46a:	83 f8 03             	cmp    $0x3,%eax
 46d:	75 75                	jne    4e4 <writeMenu+0xb4>
    *p = value;
 46f:	0f b6 15 b0 14 00 00 	movzbl 0x14b0,%edx
 476:	a1 c8 14 00 00       	mov    0x14c8,%eax
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 47b:	83 ec 04             	sub    $0x4,%esp
    *p = value;
 47e:	88 10                	mov    %dl,(%eax)
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 480:	ff 35 c8 14 00 00    	pushl  0x14c8
 486:	68 0c 0d 00 00       	push   $0xd0c
 48b:	6a 01                	push   $0x1
 48d:	e8 fe 04 00 00       	call   990 <printf>
 492:	83 c4 10             	add    $0x10,%esp
}
 495:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 498:	c9                   	leave  
 499:	c3                   	ret    
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            setPointerE(atoi(address[1]));
 4a0:	83 ec 0c             	sub    $0xc,%esp
 4a3:	ff 35 d4 14 00 00    	pushl  0x14d4
 4a9:	e8 22 03 00 00       	call   7d0 <atoi>
    if(location < 0)
 4ae:	83 c4 10             	add    $0x10,%esp
 4b1:	85 c0                	test   %eax,%eax
 4b3:	78 0b                	js     4c0 <writeMenu+0x90>
        *end = location;
 4b5:	8b 15 ec 14 00 00    	mov    0x14ec,%edx
 4bb:	88 02                	mov    %al,(%edx)
 4bd:	eb 06                	jmp    4c5 <writeMenu+0x95>
 4bf:	90                   	nop
 4c0:	e8 0b fc ff ff       	call   d0 <setPointerE.part.1>
            memoryViolatorW(fillValue);
 4c5:	0f be 05 b0 14 00 00 	movsbl 0x14b0,%eax
 4cc:	83 ec 0c             	sub    $0xc,%esp
 4cf:	50                   	push   %eax
 4d0:	e8 9b fd ff ff       	call   270 <memoryViolatorW>
            return;
 4d5:	83 c4 10             	add    $0x10,%esp
}
 4d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4db:	c9                   	leave  
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
    switch(n)
 4e0:	85 c0                	test   %eax,%eax
 4e2:	74 b1                	je     495 <writeMenu+0x65>
                printf(1,error);
 4e4:	50                   	push   %eax
 4e5:	50                   	push   %eax
 4e6:	ff 35 b4 14 00 00    	pushl  0x14b4
 4ec:	6a 01                	push   $0x1
 4ee:	e8 9d 04 00 00       	call   990 <printf>
                exit();
 4f3:	e8 4a 03 00 00       	call   842 <exit>
 4f8:	90                   	nop
 4f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000500 <pointerMenu>:
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	53                   	push   %ebx
        read(0, addressIndex, sizeof(addressIndex));
 504:	8d 5d d0             	lea    -0x30(%ebp),%ebx
{
 507:	83 ec 3c             	sub    $0x3c,%esp
        printf(1, menuString);
 50a:	68 78 0e 00 00       	push   $0xe78
 50f:	6a 01                	push   $0x1
 511:	e8 7a 04 00 00       	call   990 <printf>
        read(0, addressIndex, sizeof(addressIndex));
 516:	83 c4 0c             	add    $0xc,%esp
 519:	6a 28                	push   $0x28
 51b:	53                   	push   %ebx
 51c:	6a 00                	push   $0x0
 51e:	e8 37 03 00 00       	call   85a <read>
    p = address[atoi(addressIndex)];
 523:	89 1c 24             	mov    %ebx,(%esp)
 526:	e8 a5 02 00 00       	call   7d0 <atoi>
 52b:	8b 04 85 d0 14 00 00 	mov    0x14d0(,%eax,4),%eax
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 532:	83 c4 0c             	add    $0xc,%esp
 535:	50                   	push   %eax
 536:	68 0c 0d 00 00       	push   $0xd0c
 53b:	6a 01                	push   $0x1
    p = address[atoi(addressIndex)];
 53d:	a3 c8 14 00 00       	mov    %eax,0x14c8
        printf(1, "Operation completed! The pointer is currently at: %p",p);
 542:	e8 49 04 00 00       	call   990 <printf>
}
 547:	83 c4 10             	add    $0x10,%esp
 54a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 54d:	c9                   	leave  
 54e:	c3                   	ret    
 54f:	90                   	nop

00000550 <mainMenu>:
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
        read(0,integerthing, sizeof(integerthing));
 554:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
{
 557:	83 ec 2c             	sub    $0x2c,%esp
        printf(1,mainmenustring);
 55a:	68 38 0f 00 00       	push   $0xf38
 55f:	6a 01                	push   $0x1
 561:	e8 2a 04 00 00       	call   990 <printf>
        read(0,integerthing, sizeof(integerthing));
 566:	83 c4 0c             	add    $0xc,%esp
 569:	6a 14                	push   $0x14
 56b:	53                   	push   %ebx
 56c:	6a 00                	push   $0x0
 56e:	e8 e7 02 00 00       	call   85a <read>
        n = atoi(integerthing);
 573:	89 1c 24             	mov    %ebx,(%esp)
 576:	e8 55 02 00 00       	call   7d0 <atoi>
    switch(n)
 57b:	83 c4 10             	add    $0x10,%esp
 57e:	83 f8 02             	cmp    $0x2,%eax
 581:	74 3d                	je     5c0 <mainMenu+0x70>
 583:	7e 1b                	jle    5a0 <mainMenu+0x50>
 585:	83 f8 03             	cmp    $0x3,%eax
 588:	75 3d                	jne    5c7 <mainMenu+0x77>
            pointerMenu();
 58a:	e8 71 ff ff ff       	call   500 <pointerMenu>
    if(!errorFlag)
 58f:	a1 b8 14 00 00       	mov    0x14b8,%eax
 594:	85 c0                	test   %eax,%eax
 596:	74 1b                	je     5b3 <mainMenu+0x63>
}
 598:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 59b:	c9                   	leave  
 59c:	c3                   	ret    
 59d:	8d 76 00             	lea    0x0(%esi),%esi
    switch(n)
 5a0:	83 f8 01             	cmp    $0x1,%eax
 5a3:	75 2c                	jne    5d1 <mainMenu+0x81>
            readMenu();
 5a5:	e8 46 fd ff ff       	call   2f0 <readMenu>
    if(!errorFlag)
 5aa:	a1 b8 14 00 00       	mov    0x14b8,%eax
 5af:	85 c0                	test   %eax,%eax
 5b1:	75 e5                	jne    598 <mainMenu+0x48>
        mainMenu();
 5b3:	e8 98 ff ff ff       	call   550 <mainMenu>
}
 5b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5bb:	c9                   	leave  
 5bc:	c3                   	ret    
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
            writeMenu();
 5c0:	e8 6b fe ff ff       	call   430 <writeMenu>
            break;
 5c5:	eb c8                	jmp    58f <mainMenu+0x3f>
    switch(n)
 5c7:	83 f8 04             	cmp    $0x4,%eax
 5ca:	75 05                	jne    5d1 <mainMenu+0x81>
                exit();
 5cc:	e8 71 02 00 00       	call   842 <exit>
                    printf(1,error);
 5d1:	52                   	push   %edx
 5d2:	52                   	push   %edx
 5d3:	ff 35 b4 14 00 00    	pushl  0x14b4
 5d9:	6a 01                	push   $0x1
 5db:	e8 b0 03 00 00       	call   990 <printf>
                    exit();
 5e0:	e8 5d 02 00 00       	call   842 <exit>
 5e5:	66 90                	xchg   %ax,%ax
 5e7:	66 90                	xchg   %ax,%ax
 5e9:	66 90                	xchg   %ax,%ax
 5eb:	66 90                	xchg   %ax,%ax
 5ed:	66 90                	xchg   %ax,%ax
 5ef:	90                   	nop

000005f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	53                   	push   %ebx
 5f4:	8b 45 08             	mov    0x8(%ebp),%eax
 5f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 5fa:	89 c2                	mov    %eax,%edx
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 600:	83 c1 01             	add    $0x1,%ecx
 603:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 607:	83 c2 01             	add    $0x1,%edx
 60a:	84 db                	test   %bl,%bl
 60c:	88 5a ff             	mov    %bl,-0x1(%edx)
 60f:	75 ef                	jne    600 <strcpy+0x10>
    ;
  return os;
}
 611:	5b                   	pop    %ebx
 612:	5d                   	pop    %ebp
 613:	c3                   	ret    
 614:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 61a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000620 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	53                   	push   %ebx
 624:	8b 55 08             	mov    0x8(%ebp),%edx
 627:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 62a:	0f b6 02             	movzbl (%edx),%eax
 62d:	0f b6 19             	movzbl (%ecx),%ebx
 630:	84 c0                	test   %al,%al
 632:	75 1c                	jne    650 <strcmp+0x30>
 634:	eb 2a                	jmp    660 <strcmp+0x40>
 636:	8d 76 00             	lea    0x0(%esi),%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 640:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 643:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 646:	83 c1 01             	add    $0x1,%ecx
 649:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 64c:	84 c0                	test   %al,%al
 64e:	74 10                	je     660 <strcmp+0x40>
 650:	38 d8                	cmp    %bl,%al
 652:	74 ec                	je     640 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 654:	29 d8                	sub    %ebx,%eax
}
 656:	5b                   	pop    %ebx
 657:	5d                   	pop    %ebp
 658:	c3                   	ret    
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 660:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 662:	29 d8                	sub    %ebx,%eax
}
 664:	5b                   	pop    %ebx
 665:	5d                   	pop    %ebp
 666:	c3                   	ret    
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <strlen>:

uint
strlen(const char *s)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 676:	80 39 00             	cmpb   $0x0,(%ecx)
 679:	74 15                	je     690 <strlen+0x20>
 67b:	31 d2                	xor    %edx,%edx
 67d:	8d 76 00             	lea    0x0(%esi),%esi
 680:	83 c2 01             	add    $0x1,%edx
 683:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 687:	89 d0                	mov    %edx,%eax
 689:	75 f5                	jne    680 <strlen+0x10>
    ;
  return n;
}
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
 68d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 690:	31 c0                	xor    %eax,%eax
}
 692:	5d                   	pop    %ebp
 693:	c3                   	ret    
 694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 69a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 6a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ad:	89 d7                	mov    %edx,%edi
 6af:	fc                   	cld    
 6b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 6b2:	89 d0                	mov    %edx,%eax
 6b4:	5f                   	pop    %edi
 6b5:	5d                   	pop    %ebp
 6b6:	c3                   	ret    
 6b7:	89 f6                	mov    %esi,%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006c0 <strchr>:

char*
strchr(const char *s, char c)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	53                   	push   %ebx
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 6ca:	0f b6 10             	movzbl (%eax),%edx
 6cd:	84 d2                	test   %dl,%dl
 6cf:	74 1d                	je     6ee <strchr+0x2e>
    if(*s == c)
 6d1:	38 d3                	cmp    %dl,%bl
 6d3:	89 d9                	mov    %ebx,%ecx
 6d5:	75 0d                	jne    6e4 <strchr+0x24>
 6d7:	eb 17                	jmp    6f0 <strchr+0x30>
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6e0:	38 ca                	cmp    %cl,%dl
 6e2:	74 0c                	je     6f0 <strchr+0x30>
  for(; *s; s++)
 6e4:	83 c0 01             	add    $0x1,%eax
 6e7:	0f b6 10             	movzbl (%eax),%edx
 6ea:	84 d2                	test   %dl,%dl
 6ec:	75 f2                	jne    6e0 <strchr+0x20>
      return (char*)s;
  return 0;
 6ee:	31 c0                	xor    %eax,%eax
}
 6f0:	5b                   	pop    %ebx
 6f1:	5d                   	pop    %ebp
 6f2:	c3                   	ret    
 6f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000700 <gets>:

char*
gets(char *buf, int max)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 706:	31 f6                	xor    %esi,%esi
 708:	89 f3                	mov    %esi,%ebx
{
 70a:	83 ec 1c             	sub    $0x1c,%esp
 70d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 710:	eb 2f                	jmp    741 <gets+0x41>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 718:	8d 45 e7             	lea    -0x19(%ebp),%eax
 71b:	83 ec 04             	sub    $0x4,%esp
 71e:	6a 01                	push   $0x1
 720:	50                   	push   %eax
 721:	6a 00                	push   $0x0
 723:	e8 32 01 00 00       	call   85a <read>
    if(cc < 1)
 728:	83 c4 10             	add    $0x10,%esp
 72b:	85 c0                	test   %eax,%eax
 72d:	7e 1c                	jle    74b <gets+0x4b>
      break;
    buf[i++] = c;
 72f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 733:	83 c7 01             	add    $0x1,%edi
 736:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 739:	3c 0a                	cmp    $0xa,%al
 73b:	74 23                	je     760 <gets+0x60>
 73d:	3c 0d                	cmp    $0xd,%al
 73f:	74 1f                	je     760 <gets+0x60>
  for(i=0; i+1 < max; ){
 741:	83 c3 01             	add    $0x1,%ebx
 744:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 747:	89 fe                	mov    %edi,%esi
 749:	7c cd                	jl     718 <gets+0x18>
 74b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 750:	c6 03 00             	movb   $0x0,(%ebx)
}
 753:	8d 65 f4             	lea    -0xc(%ebp),%esp
 756:	5b                   	pop    %ebx
 757:	5e                   	pop    %esi
 758:	5f                   	pop    %edi
 759:	5d                   	pop    %ebp
 75a:	c3                   	ret    
 75b:	90                   	nop
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 760:	8b 75 08             	mov    0x8(%ebp),%esi
 763:	8b 45 08             	mov    0x8(%ebp),%eax
 766:	01 de                	add    %ebx,%esi
 768:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 76a:	c6 03 00             	movb   $0x0,(%ebx)
}
 76d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 770:	5b                   	pop    %ebx
 771:	5e                   	pop    %esi
 772:	5f                   	pop    %edi
 773:	5d                   	pop    %ebp
 774:	c3                   	ret    
 775:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000780 <stat>:

int
stat(const char *n, struct stat *st)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	56                   	push   %esi
 784:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 785:	83 ec 08             	sub    $0x8,%esp
 788:	6a 00                	push   $0x0
 78a:	ff 75 08             	pushl  0x8(%ebp)
 78d:	e8 f0 00 00 00       	call   882 <open>
  if(fd < 0)
 792:	83 c4 10             	add    $0x10,%esp
 795:	85 c0                	test   %eax,%eax
 797:	78 27                	js     7c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 799:	83 ec 08             	sub    $0x8,%esp
 79c:	ff 75 0c             	pushl  0xc(%ebp)
 79f:	89 c3                	mov    %eax,%ebx
 7a1:	50                   	push   %eax
 7a2:	e8 f3 00 00 00       	call   89a <fstat>
  close(fd);
 7a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 7aa:	89 c6                	mov    %eax,%esi
  close(fd);
 7ac:	e8 b9 00 00 00       	call   86a <close>
  return r;
 7b1:	83 c4 10             	add    $0x10,%esp
}
 7b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 7b7:	89 f0                	mov    %esi,%eax
 7b9:	5b                   	pop    %ebx
 7ba:	5e                   	pop    %esi
 7bb:	5d                   	pop    %ebp
 7bc:	c3                   	ret    
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 7c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 7c5:	eb ed                	jmp    7b4 <stat+0x34>
 7c7:	89 f6                	mov    %esi,%esi
 7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007d0 <atoi>:

int
atoi(const char *s)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	53                   	push   %ebx
 7d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 7d7:	0f be 11             	movsbl (%ecx),%edx
 7da:	8d 42 d0             	lea    -0x30(%edx),%eax
 7dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 7df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 7e4:	77 1f                	ja     805 <atoi+0x35>
 7e6:	8d 76 00             	lea    0x0(%esi),%esi
 7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 7f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 7f3:	83 c1 01             	add    $0x1,%ecx
 7f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 7fa:	0f be 11             	movsbl (%ecx),%edx
 7fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 800:	80 fb 09             	cmp    $0x9,%bl
 803:	76 eb                	jbe    7f0 <atoi+0x20>
  return n;
}
 805:	5b                   	pop    %ebx
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
 808:	90                   	nop
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000810 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	56                   	push   %esi
 814:	53                   	push   %ebx
 815:	8b 5d 10             	mov    0x10(%ebp),%ebx
 818:	8b 45 08             	mov    0x8(%ebp),%eax
 81b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 81e:	85 db                	test   %ebx,%ebx
 820:	7e 14                	jle    836 <memmove+0x26>
 822:	31 d2                	xor    %edx,%edx
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 828:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 82c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 82f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 832:	39 d3                	cmp    %edx,%ebx
 834:	75 f2                	jne    828 <memmove+0x18>
  return vdst;
}
 836:	5b                   	pop    %ebx
 837:	5e                   	pop    %esi
 838:	5d                   	pop    %ebp
 839:	c3                   	ret    

0000083a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 83a:	b8 01 00 00 00       	mov    $0x1,%eax
 83f:	cd 40                	int    $0x40
 841:	c3                   	ret    

00000842 <exit>:
SYSCALL(exit)
 842:	b8 02 00 00 00       	mov    $0x2,%eax
 847:	cd 40                	int    $0x40
 849:	c3                   	ret    

0000084a <wait>:
SYSCALL(wait)
 84a:	b8 03 00 00 00       	mov    $0x3,%eax
 84f:	cd 40                	int    $0x40
 851:	c3                   	ret    

00000852 <pipe>:
SYSCALL(pipe)
 852:	b8 04 00 00 00       	mov    $0x4,%eax
 857:	cd 40                	int    $0x40
 859:	c3                   	ret    

0000085a <read>:
SYSCALL(read)
 85a:	b8 05 00 00 00       	mov    $0x5,%eax
 85f:	cd 40                	int    $0x40
 861:	c3                   	ret    

00000862 <write>:
SYSCALL(write)
 862:	b8 10 00 00 00       	mov    $0x10,%eax
 867:	cd 40                	int    $0x40
 869:	c3                   	ret    

0000086a <close>:
SYSCALL(close)
 86a:	b8 15 00 00 00       	mov    $0x15,%eax
 86f:	cd 40                	int    $0x40
 871:	c3                   	ret    

00000872 <kill>:
SYSCALL(kill)
 872:	b8 06 00 00 00       	mov    $0x6,%eax
 877:	cd 40                	int    $0x40
 879:	c3                   	ret    

0000087a <exec>:
SYSCALL(exec)
 87a:	b8 07 00 00 00       	mov    $0x7,%eax
 87f:	cd 40                	int    $0x40
 881:	c3                   	ret    

00000882 <open>:
SYSCALL(open)
 882:	b8 0f 00 00 00       	mov    $0xf,%eax
 887:	cd 40                	int    $0x40
 889:	c3                   	ret    

0000088a <mknod>:
SYSCALL(mknod)
 88a:	b8 11 00 00 00       	mov    $0x11,%eax
 88f:	cd 40                	int    $0x40
 891:	c3                   	ret    

00000892 <unlink>:
SYSCALL(unlink)
 892:	b8 12 00 00 00       	mov    $0x12,%eax
 897:	cd 40                	int    $0x40
 899:	c3                   	ret    

0000089a <fstat>:
SYSCALL(fstat)
 89a:	b8 08 00 00 00       	mov    $0x8,%eax
 89f:	cd 40                	int    $0x40
 8a1:	c3                   	ret    

000008a2 <link>:
SYSCALL(link)
 8a2:	b8 13 00 00 00       	mov    $0x13,%eax
 8a7:	cd 40                	int    $0x40
 8a9:	c3                   	ret    

000008aa <mkdir>:
SYSCALL(mkdir)
 8aa:	b8 14 00 00 00       	mov    $0x14,%eax
 8af:	cd 40                	int    $0x40
 8b1:	c3                   	ret    

000008b2 <chdir>:
SYSCALL(chdir)
 8b2:	b8 09 00 00 00       	mov    $0x9,%eax
 8b7:	cd 40                	int    $0x40
 8b9:	c3                   	ret    

000008ba <dup>:
SYSCALL(dup)
 8ba:	b8 0a 00 00 00       	mov    $0xa,%eax
 8bf:	cd 40                	int    $0x40
 8c1:	c3                   	ret    

000008c2 <getpid>:
SYSCALL(getpid)
 8c2:	b8 0b 00 00 00       	mov    $0xb,%eax
 8c7:	cd 40                	int    $0x40
 8c9:	c3                   	ret    

000008ca <sbrk>:
SYSCALL(sbrk)
 8ca:	b8 0c 00 00 00       	mov    $0xc,%eax
 8cf:	cd 40                	int    $0x40
 8d1:	c3                   	ret    

000008d2 <sleep>:
SYSCALL(sleep)
 8d2:	b8 0d 00 00 00       	mov    $0xd,%eax
 8d7:	cd 40                	int    $0x40
 8d9:	c3                   	ret    

000008da <uptime>:
SYSCALL(uptime)
 8da:	b8 0e 00 00 00       	mov    $0xe,%eax
 8df:	cd 40                	int    $0x40
 8e1:	c3                   	ret    

000008e2 <setpriority>:
SYSCALL(setpriority)
 8e2:	b8 16 00 00 00       	mov    $0x16,%eax
 8e7:	cd 40                	int    $0x40
 8e9:	c3                   	ret    
 8ea:	66 90                	xchg   %ax,%ax
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	57                   	push   %edi
 8f4:	56                   	push   %esi
 8f5:	53                   	push   %ebx
 8f6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 8f9:	85 d2                	test   %edx,%edx
{
 8fb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 8fe:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 900:	79 76                	jns    978 <printint+0x88>
 902:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 906:	74 70                	je     978 <printint+0x88>
    x = -xx;
 908:	f7 d8                	neg    %eax
    neg = 1;
 90a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 911:	31 f6                	xor    %esi,%esi
 913:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 916:	eb 0a                	jmp    922 <printint+0x32>
 918:	90                   	nop
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 920:	89 fe                	mov    %edi,%esi
 922:	31 d2                	xor    %edx,%edx
 924:	8d 7e 01             	lea    0x1(%esi),%edi
 927:	f7 f1                	div    %ecx
 929:	0f b6 92 f8 0f 00 00 	movzbl 0xff8(%edx),%edx
  }while((x /= base) != 0);
 930:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 932:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 935:	75 e9                	jne    920 <printint+0x30>
  if(neg)
 937:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 93a:	85 c0                	test   %eax,%eax
 93c:	74 08                	je     946 <printint+0x56>
    buf[i++] = '-';
 93e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 943:	8d 7e 02             	lea    0x2(%esi),%edi
 946:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 94a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 94d:	8d 76 00             	lea    0x0(%esi),%esi
 950:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 953:	83 ec 04             	sub    $0x4,%esp
 956:	83 ee 01             	sub    $0x1,%esi
 959:	6a 01                	push   $0x1
 95b:	53                   	push   %ebx
 95c:	57                   	push   %edi
 95d:	88 45 d7             	mov    %al,-0x29(%ebp)
 960:	e8 fd fe ff ff       	call   862 <write>

  while(--i >= 0)
 965:	83 c4 10             	add    $0x10,%esp
 968:	39 de                	cmp    %ebx,%esi
 96a:	75 e4                	jne    950 <printint+0x60>
    putc(fd, buf[i]);
}
 96c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 96f:	5b                   	pop    %ebx
 970:	5e                   	pop    %esi
 971:	5f                   	pop    %edi
 972:	5d                   	pop    %ebp
 973:	c3                   	ret    
 974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 978:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 97f:	eb 90                	jmp    911 <printint+0x21>
 981:	eb 0d                	jmp    990 <printf>
 983:	90                   	nop
 984:	90                   	nop
 985:	90                   	nop
 986:	90                   	nop
 987:	90                   	nop
 988:	90                   	nop
 989:	90                   	nop
 98a:	90                   	nop
 98b:	90                   	nop
 98c:	90                   	nop
 98d:	90                   	nop
 98e:	90                   	nop
 98f:	90                   	nop

00000990 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 999:	8b 75 0c             	mov    0xc(%ebp),%esi
 99c:	0f b6 1e             	movzbl (%esi),%ebx
 99f:	84 db                	test   %bl,%bl
 9a1:	0f 84 b3 00 00 00    	je     a5a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 9a7:	8d 45 10             	lea    0x10(%ebp),%eax
 9aa:	83 c6 01             	add    $0x1,%esi
  state = 0;
 9ad:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 9af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 9b2:	eb 2f                	jmp    9e3 <printf+0x53>
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 9b8:	83 f8 25             	cmp    $0x25,%eax
 9bb:	0f 84 a7 00 00 00    	je     a68 <printf+0xd8>
  write(fd, &c, 1);
 9c1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 9c4:	83 ec 04             	sub    $0x4,%esp
 9c7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 9ca:	6a 01                	push   $0x1
 9cc:	50                   	push   %eax
 9cd:	ff 75 08             	pushl  0x8(%ebp)
 9d0:	e8 8d fe ff ff       	call   862 <write>
 9d5:	83 c4 10             	add    $0x10,%esp
 9d8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 9db:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 9df:	84 db                	test   %bl,%bl
 9e1:	74 77                	je     a5a <printf+0xca>
    if(state == 0){
 9e3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 9e5:	0f be cb             	movsbl %bl,%ecx
 9e8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 9eb:	74 cb                	je     9b8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9ed:	83 ff 25             	cmp    $0x25,%edi
 9f0:	75 e6                	jne    9d8 <printf+0x48>
      if(c == 'd'){
 9f2:	83 f8 64             	cmp    $0x64,%eax
 9f5:	0f 84 05 01 00 00    	je     b00 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9fb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 a01:	83 f9 70             	cmp    $0x70,%ecx
 a04:	74 72                	je     a78 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a06:	83 f8 73             	cmp    $0x73,%eax
 a09:	0f 84 99 00 00 00    	je     aa8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a0f:	83 f8 63             	cmp    $0x63,%eax
 a12:	0f 84 08 01 00 00    	je     b20 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a18:	83 f8 25             	cmp    $0x25,%eax
 a1b:	0f 84 ef 00 00 00    	je     b10 <printf+0x180>
  write(fd, &c, 1);
 a21:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a24:	83 ec 04             	sub    $0x4,%esp
 a27:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a2b:	6a 01                	push   $0x1
 a2d:	50                   	push   %eax
 a2e:	ff 75 08             	pushl  0x8(%ebp)
 a31:	e8 2c fe ff ff       	call   862 <write>
 a36:	83 c4 0c             	add    $0xc,%esp
 a39:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 a3c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 a3f:	6a 01                	push   $0x1
 a41:	50                   	push   %eax
 a42:	ff 75 08             	pushl  0x8(%ebp)
 a45:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a48:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 a4a:	e8 13 fe ff ff       	call   862 <write>
  for(i = 0; fmt[i]; i++){
 a4f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 a53:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 a56:	84 db                	test   %bl,%bl
 a58:	75 89                	jne    9e3 <printf+0x53>
    }
  }
}
 a5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a5d:	5b                   	pop    %ebx
 a5e:	5e                   	pop    %esi
 a5f:	5f                   	pop    %edi
 a60:	5d                   	pop    %ebp
 a61:	c3                   	ret    
 a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 a68:	bf 25 00 00 00       	mov    $0x25,%edi
 a6d:	e9 66 ff ff ff       	jmp    9d8 <printf+0x48>
 a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 a78:	83 ec 0c             	sub    $0xc,%esp
 a7b:	b9 10 00 00 00       	mov    $0x10,%ecx
 a80:	6a 00                	push   $0x0
 a82:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 a85:	8b 45 08             	mov    0x8(%ebp),%eax
 a88:	8b 17                	mov    (%edi),%edx
 a8a:	e8 61 fe ff ff       	call   8f0 <printint>
        ap++;
 a8f:	89 f8                	mov    %edi,%eax
 a91:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a94:	31 ff                	xor    %edi,%edi
        ap++;
 a96:	83 c0 04             	add    $0x4,%eax
 a99:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 a9c:	e9 37 ff ff ff       	jmp    9d8 <printf+0x48>
 aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 aa8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 aab:	8b 08                	mov    (%eax),%ecx
        ap++;
 aad:	83 c0 04             	add    $0x4,%eax
 ab0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 ab3:	85 c9                	test   %ecx,%ecx
 ab5:	0f 84 8e 00 00 00    	je     b49 <printf+0x1b9>
        while(*s != 0){
 abb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 abe:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 ac0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 ac2:	84 c0                	test   %al,%al
 ac4:	0f 84 0e ff ff ff    	je     9d8 <printf+0x48>
 aca:	89 75 d0             	mov    %esi,-0x30(%ebp)
 acd:	89 de                	mov    %ebx,%esi
 acf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ad2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 ad5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 ad8:	83 ec 04             	sub    $0x4,%esp
          s++;
 adb:	83 c6 01             	add    $0x1,%esi
 ade:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 ae1:	6a 01                	push   $0x1
 ae3:	57                   	push   %edi
 ae4:	53                   	push   %ebx
 ae5:	e8 78 fd ff ff       	call   862 <write>
        while(*s != 0){
 aea:	0f b6 06             	movzbl (%esi),%eax
 aed:	83 c4 10             	add    $0x10,%esp
 af0:	84 c0                	test   %al,%al
 af2:	75 e4                	jne    ad8 <printf+0x148>
 af4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 af7:	31 ff                	xor    %edi,%edi
 af9:	e9 da fe ff ff       	jmp    9d8 <printf+0x48>
 afe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 b00:	83 ec 0c             	sub    $0xc,%esp
 b03:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b08:	6a 01                	push   $0x1
 b0a:	e9 73 ff ff ff       	jmp    a82 <printf+0xf2>
 b0f:	90                   	nop
  write(fd, &c, 1);
 b10:	83 ec 04             	sub    $0x4,%esp
 b13:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 b16:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 b19:	6a 01                	push   $0x1
 b1b:	e9 21 ff ff ff       	jmp    a41 <printf+0xb1>
        putc(fd, *ap);
 b20:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 b23:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 b26:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 b28:	6a 01                	push   $0x1
        ap++;
 b2a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 b2d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 b30:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 b33:	50                   	push   %eax
 b34:	ff 75 08             	pushl  0x8(%ebp)
 b37:	e8 26 fd ff ff       	call   862 <write>
        ap++;
 b3c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 b3f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 b42:	31 ff                	xor    %edi,%edi
 b44:	e9 8f fe ff ff       	jmp    9d8 <printf+0x48>
          s = "(null)";
 b49:	bb f1 0f 00 00       	mov    $0xff1,%ebx
        while(*s != 0){
 b4e:	b8 28 00 00 00       	mov    $0x28,%eax
 b53:	e9 72 ff ff ff       	jmp    aca <printf+0x13a>
 b58:	66 90                	xchg   %ax,%ax
 b5a:	66 90                	xchg   %ax,%ax
 b5c:	66 90                	xchg   %ax,%ax
 b5e:	66 90                	xchg   %ax,%ax

00000b60 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b60:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b61:	a1 bc 14 00 00       	mov    0x14bc,%eax
{
 b66:	89 e5                	mov    %esp,%ebp
 b68:	57                   	push   %edi
 b69:	56                   	push   %esi
 b6a:	53                   	push   %ebx
 b6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 b6e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b78:	39 c8                	cmp    %ecx,%eax
 b7a:	8b 10                	mov    (%eax),%edx
 b7c:	73 32                	jae    bb0 <free+0x50>
 b7e:	39 d1                	cmp    %edx,%ecx
 b80:	72 04                	jb     b86 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b82:	39 d0                	cmp    %edx,%eax
 b84:	72 32                	jb     bb8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b86:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b89:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b8c:	39 fa                	cmp    %edi,%edx
 b8e:	74 30                	je     bc0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b90:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b93:	8b 50 04             	mov    0x4(%eax),%edx
 b96:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 b99:	39 f1                	cmp    %esi,%ecx
 b9b:	74 3a                	je     bd7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b9d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 b9f:	a3 bc 14 00 00       	mov    %eax,0x14bc
}
 ba4:	5b                   	pop    %ebx
 ba5:	5e                   	pop    %esi
 ba6:	5f                   	pop    %edi
 ba7:	5d                   	pop    %ebp
 ba8:	c3                   	ret    
 ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bb0:	39 d0                	cmp    %edx,%eax
 bb2:	72 04                	jb     bb8 <free+0x58>
 bb4:	39 d1                	cmp    %edx,%ecx
 bb6:	72 ce                	jb     b86 <free+0x26>
{
 bb8:	89 d0                	mov    %edx,%eax
 bba:	eb bc                	jmp    b78 <free+0x18>
 bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 bc0:	03 72 04             	add    0x4(%edx),%esi
 bc3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 bc6:	8b 10                	mov    (%eax),%edx
 bc8:	8b 12                	mov    (%edx),%edx
 bca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bcd:	8b 50 04             	mov    0x4(%eax),%edx
 bd0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bd3:	39 f1                	cmp    %esi,%ecx
 bd5:	75 c6                	jne    b9d <free+0x3d>
    p->s.size += bp->s.size;
 bd7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 bda:	a3 bc 14 00 00       	mov    %eax,0x14bc
    p->s.size += bp->s.size;
 bdf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 be2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 be5:	89 10                	mov    %edx,(%eax)
}
 be7:	5b                   	pop    %ebx
 be8:	5e                   	pop    %esi
 be9:	5f                   	pop    %edi
 bea:	5d                   	pop    %ebp
 beb:	c3                   	ret    
 bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bf0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bf0:	55                   	push   %ebp
 bf1:	89 e5                	mov    %esp,%ebp
 bf3:	57                   	push   %edi
 bf4:	56                   	push   %esi
 bf5:	53                   	push   %ebx
 bf6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bf9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bfc:	8b 15 bc 14 00 00    	mov    0x14bc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c02:	8d 78 07             	lea    0x7(%eax),%edi
 c05:	c1 ef 03             	shr    $0x3,%edi
 c08:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 c0b:	85 d2                	test   %edx,%edx
 c0d:	0f 84 9d 00 00 00    	je     cb0 <malloc+0xc0>
 c13:	8b 02                	mov    (%edx),%eax
 c15:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 c18:	39 cf                	cmp    %ecx,%edi
 c1a:	76 6c                	jbe    c88 <malloc+0x98>
 c1c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 c22:	bb 00 10 00 00       	mov    $0x1000,%ebx
 c27:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 c2a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 c31:	eb 0e                	jmp    c41 <malloc+0x51>
 c33:	90                   	nop
 c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c38:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c3a:	8b 48 04             	mov    0x4(%eax),%ecx
 c3d:	39 f9                	cmp    %edi,%ecx
 c3f:	73 47                	jae    c88 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c41:	39 05 bc 14 00 00    	cmp    %eax,0x14bc
 c47:	89 c2                	mov    %eax,%edx
 c49:	75 ed                	jne    c38 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 c4b:	83 ec 0c             	sub    $0xc,%esp
 c4e:	56                   	push   %esi
 c4f:	e8 76 fc ff ff       	call   8ca <sbrk>
  if(p == (char*)-1)
 c54:	83 c4 10             	add    $0x10,%esp
 c57:	83 f8 ff             	cmp    $0xffffffff,%eax
 c5a:	74 1c                	je     c78 <malloc+0x88>
  hp->s.size = nu;
 c5c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 c5f:	83 ec 0c             	sub    $0xc,%esp
 c62:	83 c0 08             	add    $0x8,%eax
 c65:	50                   	push   %eax
 c66:	e8 f5 fe ff ff       	call   b60 <free>
  return freep;
 c6b:	8b 15 bc 14 00 00    	mov    0x14bc,%edx
      if((p = morecore(nunits)) == 0)
 c71:	83 c4 10             	add    $0x10,%esp
 c74:	85 d2                	test   %edx,%edx
 c76:	75 c0                	jne    c38 <malloc+0x48>
        return 0;
  }
}
 c78:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 c7b:	31 c0                	xor    %eax,%eax
}
 c7d:	5b                   	pop    %ebx
 c7e:	5e                   	pop    %esi
 c7f:	5f                   	pop    %edi
 c80:	5d                   	pop    %ebp
 c81:	c3                   	ret    
 c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 c88:	39 cf                	cmp    %ecx,%edi
 c8a:	74 54                	je     ce0 <malloc+0xf0>
        p->s.size -= nunits;
 c8c:	29 f9                	sub    %edi,%ecx
 c8e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 c91:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 c94:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 c97:	89 15 bc 14 00 00    	mov    %edx,0x14bc
}
 c9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ca0:	83 c0 08             	add    $0x8,%eax
}
 ca3:	5b                   	pop    %ebx
 ca4:	5e                   	pop    %esi
 ca5:	5f                   	pop    %edi
 ca6:	5d                   	pop    %ebp
 ca7:	c3                   	ret    
 ca8:	90                   	nop
 ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 cb0:	c7 05 bc 14 00 00 c0 	movl   $0x14c0,0x14bc
 cb7:	14 00 00 
 cba:	c7 05 c0 14 00 00 c0 	movl   $0x14c0,0x14c0
 cc1:	14 00 00 
    base.s.size = 0;
 cc4:	b8 c0 14 00 00       	mov    $0x14c0,%eax
 cc9:	c7 05 c4 14 00 00 00 	movl   $0x0,0x14c4
 cd0:	00 00 00 
 cd3:	e9 44 ff ff ff       	jmp    c1c <malloc+0x2c>
 cd8:	90                   	nop
 cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 ce0:	8b 08                	mov    (%eax),%ecx
 ce2:	89 0a                	mov    %ecx,(%edx)
 ce4:	eb b1                	jmp    c97 <malloc+0xa7>
