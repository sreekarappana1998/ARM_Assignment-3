#include "TM4C123GH6PM.h"
#include <string.h>
#include <stdio.h>
void printMsg(const int a)
{
	 //float b=*((float*)&a);
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
			ITM_SendChar('\n');
}

