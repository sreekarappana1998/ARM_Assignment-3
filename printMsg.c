#include "TM4C123GH6PM.h"
#include <string.h>
#include <stdio.h>

void printMsgand(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	
	ITM_SendChar('\n');
	ITM_SendChar('A');
	ITM_SendChar('N');
	ITM_SendChar('D');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
		ITM_SendChar('\n');

}

void printMsgor(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	
	ITM_SendChar('\n');
	ITM_SendChar('O');
	ITM_SendChar('R');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
		ITM_SendChar('\n');

}

void printMsgnot(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	
	ITM_SendChar('\n');
	ITM_SendChar('N');
	ITM_SendChar('O');
	ITM_SendChar('T');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
		ITM_SendChar('\n');

}

void printMsgnand(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	
	ITM_SendChar('\n');
	ITM_SendChar('N');
	ITM_SendChar('A');
	ITM_SendChar('N');
	ITM_SendChar('D');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
		ITM_SendChar('\n');

}

void printMsgnor(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	
	ITM_SendChar('\n');
	ITM_SendChar('N');
	ITM_SendChar('O');
	ITM_SendChar('R');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 //Printing the first parameter
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
		ITM_SendChar('\n');

}
