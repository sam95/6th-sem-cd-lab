%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int valid=1,top=-1;
struct node
{
	char prod[20];
	struct node *lt,*rt;
}*n;
struct node *stack[30];
%}

%token digit id
%left '+''-'
%left '*' '/'
%left '(' ')'

%%
E:E'+'E {
	 createnode("E+E");
	 n->rt=pop();
	 n->lt=pop();
	 push(n);
	}
 
| E'-'E {
	createnode("E-E");
	n->rt=pop();
	n->lt=pop();
	push(n);
	}
	
| E'*'E {
	createnode("E*E");
	n->rt=pop();
	n->lt=pop();
	push(n);
	}

| E'/'E {
	createnode("E/E");
	n->rt=pop();
	n->lt=pop();
	push(n);
	}

| digit {
	createnode("digit");
	push(n);
	}

| id    {
	createnode("id");
	push(n);
	}

|'('E')'{
	createnode("(E)");
	n->rt=pop();  
        push(n);
        }
%%
push(struct node *n)
{
	stack[++top]=n;
}
struct node *pop()
{
	return stack[top--];
}
createnode(char prod[])
{
	n=(struct node *)malloc(sizeof(struct node));
	strcpy(n->prod,prod);
	n->lt=n->rt=NULL;
}
void display(struct node *root,int h)
{
		int i;
		if(root!=NULL)
		{
			display(root->rt,h+1);
			for(i=0;i<h;i++)
			printf("\t");
			printf("%s\n",root->prod);
			display(root->lt,h+1);
		}
}
void main()
{
	printf("Enter An Expression\n");
	yyparse();
	createnode("E\n");
	n->lt=pop();
	push(n);
	display(n,1);
}
int yyerror()
{
	printf("Invalid String!");
}
