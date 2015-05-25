#include<stdio.h>
#include<string.h>
char stmt[3][20],input[30];
int len,cur,i,j;
void gen();
int main()
{
	int index=0;
	printf("Format of if statement :\n");
	printf("if (a<b) then (s=a);\n");
	printf("if (a<b) then (s=a) else (s=b);\n");
	printf("Enter the statement\n"); //All the Print statements are the formats in which you are supposed to give the input
	gets(input); //Don't use scanf("%s",...) because scanf takes the input only till a space (' ')
	len=strlen(input);//Calculating the length
	for(i=0;i<len && input[i]!=';';i++)
	{
		if(input[i]=='(')//Our main input starts with a '(' i.e after the if statement
		{
			i++;//To neglect the '(' in the ouput
			index=0;
			for(j=i;input[j]!=')';j++)
			{
				stmt[cur][index++]=input[j]; //a 2-D array to store all the characters of the input
			}//Cur variable stores the input in stages
			//suppose the input is "if (a<b) then (s=a);"
			//cur[0]="a<b";
			//cur[1]="s=a";
			//At the end just print the above statements
			//printf("%s\n",stmt[cur]);
			//Uncomment the above statement for more clarity
			cur++;
			i=j;//Since the j variable has already processed the string till some point, making i process from where the string is to be processed
		}
	}
	gen();//To generate the ouput
}
void gen()
{
	int l1=101,l2=102,l3=103; //Just random labels for output 
	printf("if (%s) goto %d\n",stmt[0],l1);//Remember! for the above example input, cur[0]="a<b"; we're just printing that
	printf("goto %d \n",l2);//Printing a label
	printf("%d: %s\n",l1,stmt[1]);//The "s=a" part
	if(cur<3)
	{
		printf("%d STOP\n",l2);
	}
	else //If an else is provided in the input then the below statements are also to be printed
	{
		printf("goto %d\n",l3);
		printf("%d: %s\n",l2,stmt[2]);
		printf("%d: STOP\n",l3);
	}
}
//Contact for any doubts!
//12th please mugg! :P
