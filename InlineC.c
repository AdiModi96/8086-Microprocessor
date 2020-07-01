#include<stdio.h>

int main()
{
	int n1=0, n2=0, sum, sub, mul, div,rem;
	
	printf("Enter your First Number: ");
	scanf("%d", &n1);
	printf("Enter your Second Number: ");
	scanf("%d", &n2);
    
    __asm__("addl %%ebx, %%eax;" : "=a"(sum) : "a"(n1),"b"(n2));
    printf("Addition: %d\n",sum);

    __asm__("subl %%ebx, %%eax;" : "=a"(sub) : "a"(n1),"b"(n2));
    printf("Subtraction: %d\n",sub);

    __asm__("imul %%ebx, %%eax;" : "=a"(mul) : "a"(n1),"b"(n2));
    printf("Multiplication: %d\n",mul);

    __asm__("cmpl $0, %%ebx;"
    		"je ZEROJUMP;"
    		"movl $0x0, %%edx;"
    		"movl %2, %%eax;"
    		"movl %3, %%ebx;"
    		"idivl %%ebx;"
    		"jg EXIT;"
    		"ZEROJUMP: movl $-1, %%eax;"
    		"movl $-1, %%edx;"
    		"EXIT:" : "=a"(div), "=d"(rem) : "a"(n1),"b"(n2));
		 
	printf("Division|Remainder: %d|%d\n",div, rem);

	return 0;
}