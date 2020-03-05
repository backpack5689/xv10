
_rand:     file format elf32-i386


Disassembly of section .text:

00000000 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
   0:	55                   	push   %ebp
   1:	b8 e4 0b 00 00       	mov    $0xbe4,%eax
   6:	b9 9c 15 00 00       	mov    $0x159c,%ecx
   b:	89 e5                	mov    %esp,%ebp
   d:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
  10:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
  16:	eb 0b                	jmp    23 <sgenrand+0x23>
  18:	90                   	nop
  19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  20:	83 c0 04             	add    $0x4,%eax
    for (mti=1; mti<N; mti++)
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
  23:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
  29:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
  2b:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
  2d:	75 f1                	jne    20 <sgenrand+0x20>
  2f:	c7 05 cc 0b 00 00 70 	movl   $0x270,0xbcc
  36:	02 00 00 
}
  39:	5d                   	pop    %ebp
  3a:	c3                   	ret    
  3b:	90                   	nop
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
  40:	a1 cc 0b 00 00       	mov    0xbcc,%eax
{
  45:	55                   	push   %ebp
  46:	89 e5                	mov    %esp,%ebp
  48:	56                   	push   %esi
  49:	53                   	push   %ebx
    if (mti >= N) { /* generate N words at one time */
  4a:	3d 6f 02 00 00       	cmp    $0x26f,%eax
  4f:	0f 8e f9 00 00 00    	jle    14e <genrand+0x10e>
        int kk;

        if (mti == N+1)   /* if sgenrand() has not been called, */
  55:	3d 71 02 00 00       	cmp    $0x271,%eax
  5a:	0f 84 fa 00 00 00    	je     15a <genrand+0x11a>
  60:	ba e0 0b 00 00       	mov    $0xbe0,%edx
  65:	bb 6c 0f 00 00       	mov    $0xf6c,%ebx
    mt[0]= seed & 0xffffffff;
  6a:	89 d1                	mov    %edx,%ecx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            sgenrand(4357); /* a default initial seed is used   */

        for (kk=0;kk<N-M;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
  70:	8b 01                	mov    (%ecx),%eax
  72:	8b 71 04             	mov    0x4(%ecx),%esi
  75:	83 c1 04             	add    $0x4,%ecx
  78:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
  7e:	25 00 00 00 80       	and    $0x80000000,%eax
  83:	09 f0                	or     %esi,%eax
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
  85:	89 c6                	mov    %eax,%esi
  87:	83 e0 01             	and    $0x1,%eax
  8a:	d1 ee                	shr    %esi
  8c:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
  92:	33 34 85 c8 08 00 00 	xor    0x8c8(,%eax,4),%esi
  99:	89 71 fc             	mov    %esi,-0x4(%ecx)
        for (kk=0;kk<N-M;kk++) {
  9c:	39 cb                	cmp    %ecx,%ebx
  9e:	75 d0                	jne    70 <genrand+0x30>
  a0:	b9 10 12 00 00       	mov    $0x1210,%ecx
  a5:	8d 76 00             	lea    0x0(%esi),%esi
        }
        for (;kk<N-1;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
  a8:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
  ae:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
  b4:	83 c2 04             	add    $0x4,%edx
  b7:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
  bd:	25 00 00 00 80       	and    $0x80000000,%eax
  c2:	09 d8                	or     %ebx,%eax
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
  c4:	89 c3                	mov    %eax,%ebx
  c6:	83 e0 01             	and    $0x1,%eax
  c9:	d1 eb                	shr    %ebx
  cb:	33 5a fc             	xor    -0x4(%edx),%ebx
  ce:	33 1c 85 c8 08 00 00 	xor    0x8c8(,%eax,4),%ebx
  d5:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
        for (;kk<N-1;kk++) {
  db:	39 d1                	cmp    %edx,%ecx
  dd:	75 c9                	jne    a8 <genrand+0x68>
        }
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
  df:	a1 e0 0b 00 00       	mov    0xbe0,%eax
  e4:	8b 0d 9c 15 00 00    	mov    0x159c,%ecx
  ea:	89 c2                	mov    %eax,%edx
  ec:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
  f2:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
  f8:	09 d1                	or     %edx,%ecx
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
  fa:	89 ca                	mov    %ecx,%edx
  fc:	83 e1 01             	and    $0x1,%ecx
  ff:	d1 ea                	shr    %edx
 101:	33 15 10 12 00 00    	xor    0x1210,%edx
 107:	33 14 8d c8 08 00 00 	xor    0x8c8(,%ecx,4),%edx
 10e:	89 15 9c 15 00 00    	mov    %edx,0x159c
 114:	ba 01 00 00 00       	mov    $0x1,%edx

        mti = 0;
    }
  
    y = mt[mti++];
 119:	89 15 cc 0b 00 00    	mov    %edx,0xbcc
    y ^= TEMPERING_SHIFT_U(y);
 11f:	89 c2                	mov    %eax,%edx
 121:	c1 ea 0b             	shr    $0xb,%edx
 124:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 126:	89 d0                	mov    %edx,%eax
 128:	c1 e0 07             	shl    $0x7,%eax
 12b:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 130:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 132:	89 d0                	mov    %edx,%eax
 134:	c1 e0 0f             	shl    $0xf,%eax
 137:	25 00 00 c6 ef       	and    $0xefc60000,%eax
 13c:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_L(y);
 13e:	89 c2                	mov    %eax,%edx
 140:	c1 ea 12             	shr    $0x12,%edx
 143:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
}
 145:	5b                   	pop    %ebx
    return y & RAND_MAX;
 146:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 14b:	5e                   	pop    %esi
 14c:	5d                   	pop    %ebp
 14d:	c3                   	ret    
 14e:	8d 50 01             	lea    0x1(%eax),%edx
 151:	8b 04 85 e0 0b 00 00 	mov    0xbe0(,%eax,4),%eax
 158:	eb bf                	jmp    119 <genrand+0xd9>
    mt[0]= seed & 0xffffffff;
 15a:	c7 05 e0 0b 00 00 05 	movl   $0x1105,0xbe0
 161:	11 00 00 
 164:	b8 e4 0b 00 00       	mov    $0xbe4,%eax
 169:	b9 9c 15 00 00       	mov    $0x159c,%ecx
 16e:	ba 05 11 00 00       	mov    $0x1105,%edx
 173:	eb 06                	jmp    17b <genrand+0x13b>
 175:	8d 76 00             	lea    0x0(%esi),%esi
 178:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 17b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
 181:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 183:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 185:	75 f1                	jne    178 <genrand+0x138>
 187:	e9 d4 fe ff ff       	jmp    60 <genrand+0x20>
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 190:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 191:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 193:	89 e5                	mov    %esp,%ebp
 195:	56                   	push   %esi
 196:	53                   	push   %ebx
    num_bins = (unsigned long) max + 1,
 197:	8b 45 08             	mov    0x8(%ebp),%eax
    bin_size = num_rand / num_bins,
 19a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 19f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 1a2:	89 d8                	mov    %ebx,%eax
 1a4:	f7 f1                	div    %ecx
 1a6:	89 c6                	mov    %eax,%esi
 1a8:	29 d3                	sub    %edx,%ebx
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    defect   = num_rand % num_bins;

  long x;
  do {
   x = genrand();
 1b0:	e8 8b fe ff ff       	call   40 <genrand>
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 1b5:	39 d8                	cmp    %ebx,%eax
 1b7:	73 f7                	jae    1b0 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 1b9:	31 d2                	xor    %edx,%edx
 1bb:	f7 f6                	div    %esi
 1bd:	5b                   	pop    %ebx
 1be:	5e                   	pop    %esi
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	66 90                	xchg   %ax,%ax
 1c3:	66 90                	xchg   %ax,%ax
 1c5:	66 90                	xchg   %ax,%ax
 1c7:	66 90                	xchg   %ax,%ax
 1c9:	66 90                	xchg   %ax,%ax
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1da:	89 c2                	mov    %eax,%edx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	83 c1 01             	add    $0x1,%ecx
 1e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1e7:	83 c2 01             	add    $0x1,%edx
 1ea:	84 db                	test   %bl,%bl
 1ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 1ef:	75 ef                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1f1:	5b                   	pop    %ebx
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
 207:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20a:	0f b6 02             	movzbl (%edx),%eax
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	84 c0                	test   %al,%al
 212:	75 1c                	jne    230 <strcmp+0x30>
 214:	eb 2a                	jmp    240 <strcmp+0x40>
 216:	8d 76 00             	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 220:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 223:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 226:	83 c1 01             	add    $0x1,%ecx
 229:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 22c:	84 c0                	test   %al,%al
 22e:	74 10                	je     240 <strcmp+0x40>
 230:	38 d8                	cmp    %bl,%al
 232:	74 ec                	je     220 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 234:	29 d8                	sub    %ebx,%eax
}
 236:	5b                   	pop    %ebx
 237:	5d                   	pop    %ebp
 238:	c3                   	ret    
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 242:	29 d8                	sub    %ebx,%eax
}
 244:	5b                   	pop    %ebx
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 39 00             	cmpb   $0x0,(%ecx)
 259:	74 15                	je     270 <strlen+0x20>
 25b:	31 d2                	xor    %edx,%edx
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c2 01             	add    $0x1,%edx
 263:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 267:	89 d0                	mov    %edx,%eax
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
 26d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 270:	31 c0                	xor    %eax,%eax
}
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    
 274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 27a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	74 1d                	je     2ce <strchr+0x2e>
    if(*s == c)
 2b1:	38 d3                	cmp    %dl,%bl
 2b3:	89 d9                	mov    %ebx,%ecx
 2b5:	75 0d                	jne    2c4 <strchr+0x24>
 2b7:	eb 17                	jmp    2d0 <strchr+0x30>
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c0:	38 ca                	cmp    %cl,%dl
 2c2:	74 0c                	je     2d0 <strchr+0x30>
  for(; *s; s++)
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ce:	31 c0                	xor    %eax,%eax
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e6:	31 f6                	xor    %esi,%esi
 2e8:	89 f3                	mov    %esi,%ebx
{
 2ea:	83 ec 1c             	sub    $0x1c,%esp
 2ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2f0:	eb 2f                	jmp    321 <gets+0x41>
 2f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2fb:	83 ec 04             	sub    $0x4,%esp
 2fe:	6a 01                	push   $0x1
 300:	50                   	push   %eax
 301:	6a 00                	push   $0x0
 303:	e8 32 01 00 00       	call   43a <read>
    if(cc < 1)
 308:	83 c4 10             	add    $0x10,%esp
 30b:	85 c0                	test   %eax,%eax
 30d:	7e 1c                	jle    32b <gets+0x4b>
      break;
    buf[i++] = c;
 30f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 313:	83 c7 01             	add    $0x1,%edi
 316:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 319:	3c 0a                	cmp    $0xa,%al
 31b:	74 23                	je     340 <gets+0x60>
 31d:	3c 0d                	cmp    $0xd,%al
 31f:	74 1f                	je     340 <gets+0x60>
  for(i=0; i+1 < max; ){
 321:	83 c3 01             	add    $0x1,%ebx
 324:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 327:	89 fe                	mov    %edi,%esi
 329:	7c cd                	jl     2f8 <gets+0x18>
 32b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 330:	c6 03 00             	movb   $0x0,(%ebx)
}
 333:	8d 65 f4             	lea    -0xc(%ebp),%esp
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	90                   	nop
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 340:	8b 75 08             	mov    0x8(%ebp),%esi
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	01 de                	add    %ebx,%esi
 348:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 34a:	c6 03 00             	movb   $0x0,(%ebx)
}
 34d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5f                   	pop    %edi
 353:	5d                   	pop    %ebp
 354:	c3                   	ret    
 355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	pushl  0x8(%ebp)
 36d:	e8 f0 00 00 00       	call   462 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	pushl  0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 f3 00 00 00       	call   47a <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 b9 00 00 00       	call   44a <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 11             	movsbl (%ecx),%edx
 3ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 3bd:	3c 09                	cmp    $0x9,%al
  n = 0;
 3bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3c4:	77 1f                	ja     3e5 <atoi+0x35>
 3c6:	8d 76 00             	lea    0x0(%esi),%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3d3:	83 c1 01             	add    $0x1,%ecx
 3d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3da:	0f be 11             	movsbl (%ecx),%edx
 3dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
  return n;
}
 3e5:	5b                   	pop    %ebx
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    
 3e8:	90                   	nop
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	56                   	push   %esi
 3f4:	53                   	push   %ebx
 3f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 db                	test   %ebx,%ebx
 400:	7e 14                	jle    416 <memmove+0x26>
 402:	31 d2                	xor    %edx,%edx
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 408:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 40c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 40f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 412:	39 d3                	cmp    %edx,%ebx
 414:	75 f2                	jne    408 <memmove+0x18>
  return vdst;
}
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    

0000041a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41a:	b8 01 00 00 00       	mov    $0x1,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <exit>:
SYSCALL(exit)
 422:	b8 02 00 00 00       	mov    $0x2,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <wait>:
SYSCALL(wait)
 42a:	b8 03 00 00 00       	mov    $0x3,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <pipe>:
SYSCALL(pipe)
 432:	b8 04 00 00 00       	mov    $0x4,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <read>:
SYSCALL(read)
 43a:	b8 05 00 00 00       	mov    $0x5,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <write>:
SYSCALL(write)
 442:	b8 10 00 00 00       	mov    $0x10,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <close>:
SYSCALL(close)
 44a:	b8 15 00 00 00       	mov    $0x15,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <kill>:
SYSCALL(kill)
 452:	b8 06 00 00 00       	mov    $0x6,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <exec>:
SYSCALL(exec)
 45a:	b8 07 00 00 00       	mov    $0x7,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <open>:
SYSCALL(open)
 462:	b8 0f 00 00 00       	mov    $0xf,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <mknod>:
SYSCALL(mknod)
 46a:	b8 11 00 00 00       	mov    $0x11,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <unlink>:
SYSCALL(unlink)
 472:	b8 12 00 00 00       	mov    $0x12,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <fstat>:
SYSCALL(fstat)
 47a:	b8 08 00 00 00       	mov    $0x8,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <link>:
SYSCALL(link)
 482:	b8 13 00 00 00       	mov    $0x13,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <mkdir>:
SYSCALL(mkdir)
 48a:	b8 14 00 00 00       	mov    $0x14,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <chdir>:
SYSCALL(chdir)
 492:	b8 09 00 00 00       	mov    $0x9,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <dup>:
SYSCALL(dup)
 49a:	b8 0a 00 00 00       	mov    $0xa,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <getpid>:
SYSCALL(getpid)
 4a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <sbrk>:
SYSCALL(sbrk)
 4aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <sleep>:
SYSCALL(sleep)
 4b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <uptime>:
SYSCALL(uptime)
 4ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <setpriority>:
SYSCALL(setpriority)
 4c2:	b8 16 00 00 00       	mov    $0x16,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    
 4ca:	66 90                	xchg   %ax,%ax
 4cc:	66 90                	xchg   %ax,%ax
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4d9:	85 d2                	test   %edx,%edx
{
 4db:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4de:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4e0:	79 76                	jns    558 <printint+0x88>
 4e2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4e6:	74 70                	je     558 <printint+0x88>
    x = -xx;
 4e8:	f7 d8                	neg    %eax
    neg = 1;
 4ea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4f1:	31 f6                	xor    %esi,%esi
 4f3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4f6:	eb 0a                	jmp    502 <printint+0x32>
 4f8:	90                   	nop
 4f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 fe                	mov    %edi,%esi
 502:	31 d2                	xor    %edx,%edx
 504:	8d 7e 01             	lea    0x1(%esi),%edi
 507:	f7 f1                	div    %ecx
 509:	0f b6 92 d8 08 00 00 	movzbl 0x8d8(%edx),%edx
  }while((x /= base) != 0);
 510:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 512:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 515:	75 e9                	jne    500 <printint+0x30>
  if(neg)
 517:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 51a:	85 c0                	test   %eax,%eax
 51c:	74 08                	je     526 <printint+0x56>
    buf[i++] = '-';
 51e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 523:	8d 7e 02             	lea    0x2(%esi),%edi
 526:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 52a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
 536:	83 ee 01             	sub    $0x1,%esi
 539:	6a 01                	push   $0x1
 53b:	53                   	push   %ebx
 53c:	57                   	push   %edi
 53d:	88 45 d7             	mov    %al,-0x29(%ebp)
 540:	e8 fd fe ff ff       	call   442 <write>

  while(--i >= 0)
 545:	83 c4 10             	add    $0x10,%esp
 548:	39 de                	cmp    %ebx,%esi
 54a:	75 e4                	jne    530 <printint+0x60>
    putc(fd, buf[i]);
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 55f:	eb 90                	jmp    4f1 <printint+0x21>
 561:	eb 0d                	jmp    570 <printf>
 563:	90                   	nop
 564:	90                   	nop
 565:	90                   	nop
 566:	90                   	nop
 567:	90                   	nop
 568:	90                   	nop
 569:	90                   	nop
 56a:	90                   	nop
 56b:	90                   	nop
 56c:	90                   	nop
 56d:	90                   	nop
 56e:	90                   	nop
 56f:	90                   	nop

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 75 0c             	mov    0xc(%ebp),%esi
 57c:	0f b6 1e             	movzbl (%esi),%ebx
 57f:	84 db                	test   %bl,%bl
 581:	0f 84 b3 00 00 00    	je     63a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 587:	8d 45 10             	lea    0x10(%ebp),%eax
 58a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 58d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 58f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 592:	eb 2f                	jmp    5c3 <printf+0x53>
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 598:	83 f8 25             	cmp    $0x25,%eax
 59b:	0f 84 a7 00 00 00    	je     648 <printf+0xd8>
  write(fd, &c, 1);
 5a1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5a4:	83 ec 04             	sub    $0x4,%esp
 5a7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5aa:	6a 01                	push   $0x1
 5ac:	50                   	push   %eax
 5ad:	ff 75 08             	pushl  0x8(%ebp)
 5b0:	e8 8d fe ff ff       	call   442 <write>
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5bb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5bf:	84 db                	test   %bl,%bl
 5c1:	74 77                	je     63a <printf+0xca>
    if(state == 0){
 5c3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5c5:	0f be cb             	movsbl %bl,%ecx
 5c8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5cb:	74 cb                	je     598 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5cd:	83 ff 25             	cmp    $0x25,%edi
 5d0:	75 e6                	jne    5b8 <printf+0x48>
      if(c == 'd'){
 5d2:	83 f8 64             	cmp    $0x64,%eax
 5d5:	0f 84 05 01 00 00    	je     6e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5e1:	83 f9 70             	cmp    $0x70,%ecx
 5e4:	74 72                	je     658 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5e6:	83 f8 73             	cmp    $0x73,%eax
 5e9:	0f 84 99 00 00 00    	je     688 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ef:	83 f8 63             	cmp    $0x63,%eax
 5f2:	0f 84 08 01 00 00    	je     700 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	0f 84 ef 00 00 00    	je     6f0 <printf+0x180>
  write(fd, &c, 1);
 601:	8d 45 e7             	lea    -0x19(%ebp),%eax
 604:	83 ec 04             	sub    $0x4,%esp
 607:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 60b:	6a 01                	push   $0x1
 60d:	50                   	push   %eax
 60e:	ff 75 08             	pushl  0x8(%ebp)
 611:	e8 2c fe ff ff       	call   442 <write>
 616:	83 c4 0c             	add    $0xc,%esp
 619:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 61c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 61f:	6a 01                	push   $0x1
 621:	50                   	push   %eax
 622:	ff 75 08             	pushl  0x8(%ebp)
 625:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 628:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 62a:	e8 13 fe ff ff       	call   442 <write>
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 633:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 636:	84 db                	test   %bl,%bl
 638:	75 89                	jne    5c3 <printf+0x53>
    }
  }
}
 63a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63d:	5b                   	pop    %ebx
 63e:	5e                   	pop    %esi
 63f:	5f                   	pop    %edi
 640:	5d                   	pop    %ebp
 641:	c3                   	ret    
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 648:	bf 25 00 00 00       	mov    $0x25,%edi
 64d:	e9 66 ff ff ff       	jmp    5b8 <printf+0x48>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 658:	83 ec 0c             	sub    $0xc,%esp
 65b:	b9 10 00 00 00       	mov    $0x10,%ecx
 660:	6a 00                	push   $0x0
 662:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 665:	8b 45 08             	mov    0x8(%ebp),%eax
 668:	8b 17                	mov    (%edi),%edx
 66a:	e8 61 fe ff ff       	call   4d0 <printint>
        ap++;
 66f:	89 f8                	mov    %edi,%eax
 671:	83 c4 10             	add    $0x10,%esp
      state = 0;
 674:	31 ff                	xor    %edi,%edi
        ap++;
 676:	83 c0 04             	add    $0x4,%eax
 679:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 67c:	e9 37 ff ff ff       	jmp    5b8 <printf+0x48>
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 688:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 68b:	8b 08                	mov    (%eax),%ecx
        ap++;
 68d:	83 c0 04             	add    $0x4,%eax
 690:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 693:	85 c9                	test   %ecx,%ecx
 695:	0f 84 8e 00 00 00    	je     729 <printf+0x1b9>
        while(*s != 0){
 69b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 69e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6a0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6a2:	84 c0                	test   %al,%al
 6a4:	0f 84 0e ff ff ff    	je     5b8 <printf+0x48>
 6aa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6ad:	89 de                	mov    %ebx,%esi
 6af:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6b2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 6b5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6b8:	83 ec 04             	sub    $0x4,%esp
          s++;
 6bb:	83 c6 01             	add    $0x1,%esi
 6be:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6c1:	6a 01                	push   $0x1
 6c3:	57                   	push   %edi
 6c4:	53                   	push   %ebx
 6c5:	e8 78 fd ff ff       	call   442 <write>
        while(*s != 0){
 6ca:	0f b6 06             	movzbl (%esi),%eax
 6cd:	83 c4 10             	add    $0x10,%esp
 6d0:	84 c0                	test   %al,%al
 6d2:	75 e4                	jne    6b8 <printf+0x148>
 6d4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6d7:	31 ff                	xor    %edi,%edi
 6d9:	e9 da fe ff ff       	jmp    5b8 <printf+0x48>
 6de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	e9 73 ff ff ff       	jmp    662 <printf+0xf2>
 6ef:	90                   	nop
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
 6f3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6f6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6f9:	6a 01                	push   $0x1
 6fb:	e9 21 ff ff ff       	jmp    621 <printf+0xb1>
        putc(fd, *ap);
 700:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 706:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 708:	6a 01                	push   $0x1
        ap++;
 70a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 70d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 710:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 713:	50                   	push   %eax
 714:	ff 75 08             	pushl  0x8(%ebp)
 717:	e8 26 fd ff ff       	call   442 <write>
        ap++;
 71c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 71f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 722:	31 ff                	xor    %edi,%edi
 724:	e9 8f fe ff ff       	jmp    5b8 <printf+0x48>
          s = "(null)";
 729:	bb d0 08 00 00       	mov    $0x8d0,%ebx
        while(*s != 0){
 72e:	b8 28 00 00 00       	mov    $0x28,%eax
 733:	e9 72 ff ff ff       	jmp    6aa <printf+0x13a>
 738:	66 90                	xchg   %ax,%ax
 73a:	66 90                	xchg   %ax,%ax
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 a0 15 00 00       	mov    0x15a0,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 758:	39 c8                	cmp    %ecx,%eax
 75a:	8b 10                	mov    (%eax),%edx
 75c:	73 32                	jae    790 <free+0x50>
 75e:	39 d1                	cmp    %edx,%ecx
 760:	72 04                	jb     766 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 762:	39 d0                	cmp    %edx,%eax
 764:	72 32                	jb     798 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 766:	8b 73 fc             	mov    -0x4(%ebx),%esi
 769:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76c:	39 fa                	cmp    %edi,%edx
 76e:	74 30                	je     7a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 770:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 773:	8b 50 04             	mov    0x4(%eax),%edx
 776:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 779:	39 f1                	cmp    %esi,%ecx
 77b:	74 3a                	je     7b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 77d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 77f:	a3 a0 15 00 00       	mov    %eax,0x15a0
}
 784:	5b                   	pop    %ebx
 785:	5e                   	pop    %esi
 786:	5f                   	pop    %edi
 787:	5d                   	pop    %ebp
 788:	c3                   	ret    
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 d0                	cmp    %edx,%eax
 792:	72 04                	jb     798 <free+0x58>
 794:	39 d1                	cmp    %edx,%ecx
 796:	72 ce                	jb     766 <free+0x26>
{
 798:	89 d0                	mov    %edx,%eax
 79a:	eb bc                	jmp    758 <free+0x18>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7a0:	03 72 04             	add    0x4(%edx),%esi
 7a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a6:	8b 10                	mov    (%eax),%edx
 7a8:	8b 12                	mov    (%edx),%edx
 7aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ad:	8b 50 04             	mov    0x4(%eax),%edx
 7b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b3:	39 f1                	cmp    %esi,%ecx
 7b5:	75 c6                	jne    77d <free+0x3d>
    p->s.size += bp->s.size;
 7b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ba:	a3 a0 15 00 00       	mov    %eax,0x15a0
    p->s.size += bp->s.size;
 7bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7c5:	89 10                	mov    %edx,(%eax)
}
 7c7:	5b                   	pop    %ebx
 7c8:	5e                   	pop    %esi
 7c9:	5f                   	pop    %edi
 7ca:	5d                   	pop    %ebp
 7cb:	c3                   	ret    
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 15 a0 15 00 00    	mov    0x15a0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 78 07             	lea    0x7(%eax),%edi
 7e5:	c1 ef 03             	shr    $0x3,%edi
 7e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7eb:	85 d2                	test   %edx,%edx
 7ed:	0f 84 9d 00 00 00    	je     890 <malloc+0xc0>
 7f3:	8b 02                	mov    (%edx),%eax
 7f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7f8:	39 cf                	cmp    %ecx,%edi
 7fa:	76 6c                	jbe    868 <malloc+0x98>
 7fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 802:	bb 00 10 00 00       	mov    $0x1000,%ebx
 807:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 80a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 811:	eb 0e                	jmp    821 <malloc+0x51>
 813:	90                   	nop
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 818:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 81a:	8b 48 04             	mov    0x4(%eax),%ecx
 81d:	39 f9                	cmp    %edi,%ecx
 81f:	73 47                	jae    868 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 821:	39 05 a0 15 00 00    	cmp    %eax,0x15a0
 827:	89 c2                	mov    %eax,%edx
 829:	75 ed                	jne    818 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 82b:	83 ec 0c             	sub    $0xc,%esp
 82e:	56                   	push   %esi
 82f:	e8 76 fc ff ff       	call   4aa <sbrk>
  if(p == (char*)-1)
 834:	83 c4 10             	add    $0x10,%esp
 837:	83 f8 ff             	cmp    $0xffffffff,%eax
 83a:	74 1c                	je     858 <malloc+0x88>
  hp->s.size = nu;
 83c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 83f:	83 ec 0c             	sub    $0xc,%esp
 842:	83 c0 08             	add    $0x8,%eax
 845:	50                   	push   %eax
 846:	e8 f5 fe ff ff       	call   740 <free>
  return freep;
 84b:	8b 15 a0 15 00 00    	mov    0x15a0,%edx
      if((p = morecore(nunits)) == 0)
 851:	83 c4 10             	add    $0x10,%esp
 854:	85 d2                	test   %edx,%edx
 856:	75 c0                	jne    818 <malloc+0x48>
        return 0;
  }
}
 858:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 85b:	31 c0                	xor    %eax,%eax
}
 85d:	5b                   	pop    %ebx
 85e:	5e                   	pop    %esi
 85f:	5f                   	pop    %edi
 860:	5d                   	pop    %ebp
 861:	c3                   	ret    
 862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 868:	39 cf                	cmp    %ecx,%edi
 86a:	74 54                	je     8c0 <malloc+0xf0>
        p->s.size -= nunits;
 86c:	29 f9                	sub    %edi,%ecx
 86e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 871:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 874:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 877:	89 15 a0 15 00 00    	mov    %edx,0x15a0
}
 87d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 880:	83 c0 08             	add    $0x8,%eax
}
 883:	5b                   	pop    %ebx
 884:	5e                   	pop    %esi
 885:	5f                   	pop    %edi
 886:	5d                   	pop    %ebp
 887:	c3                   	ret    
 888:	90                   	nop
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 a0 15 00 00 a4 	movl   $0x15a4,0x15a0
 897:	15 00 00 
 89a:	c7 05 a4 15 00 00 a4 	movl   $0x15a4,0x15a4
 8a1:	15 00 00 
    base.s.size = 0;
 8a4:	b8 a4 15 00 00       	mov    $0x15a4,%eax
 8a9:	c7 05 a8 15 00 00 00 	movl   $0x0,0x15a8
 8b0:	00 00 00 
 8b3:	e9 44 ff ff ff       	jmp    7fc <malloc+0x2c>
 8b8:	90                   	nop
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb b1                	jmp    877 <malloc+0xa7>
