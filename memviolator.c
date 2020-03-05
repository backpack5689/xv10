#ifdef __pie__
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#else
#include "types.h"
#include "stat.h"
#include "user.h"
#endif

//-----GLOBAL VARIABLES-----
char * p;
char * end;
char ** argv;
int size;
extern char _end;
char * error = "Error, you entered a non-exsistent option, exiting.";
int errorFlag = 0;
char fillValue = 'i';
int * ptr;


//-----GLOBAL VARIABLES PT. 2-----
char * address[6];
//-----PRINTING FUNCTIONS-----
//These functions are just to simplify printing

//This prints that the function completed properly and what the current pointer is at
void printCompletion()
{
    #ifdef __pie__
        printf("Operation completed! The pointer is currently at: %p",p);
    #else
        printf(1, "Operation completed! The pointer is currently at: %p",p);
    #endif
}


//-----MEMORY & POINTER FUNCTIONS-----
//These functions do all the memory operations that can be requested by the user

//This function will read the next 16 address spaces (the next 100 bytes)
void memoryViolatorR()
{
    int i, j;    

    for(j = 0; j < 16; j++)
    {
        #ifdef __pie__
            printf("%p: ", p);
        #else
            printf(1, "%p: ", p);
        #endif

        for(i = 0; i < 16; i++)
        {
            #ifdef __pie__
                printf("%x", *p);
            #else
                printf(1, "%x", *p);
            #endif
            
            p++;
        }

        #ifdef __pie__
            printf("\n");
        #else
            printf(1, "\n");
        #endif
    }
}

//Sets where your pointer is at
void setPointer(int location)
{
    int temp;
    if(location < 0 )
    {
        char in[40];
        #ifdef __pie__
            printf("Enter your custom address value:\n");
            scanf("%l", temp);
        #else
            printf(1, "Enter your custom address value:\n");
            read(0, in, sizeof(in));
            temp = atoi(in);
        #endif
        printCompletion();
    }
    else
    {
        temp = location;
    }
    p = (char*)temp;
}

void setPointerE(int location)
{
    if(location < 0)
    {
        int temp;
        char in[20];
        #ifdef __pie__
            printf("Enter your custom address value:\n");
            scanf("%d", temp);
        #else
            printf(1, "Enter your custom address value:\n");
            read(0, in, sizeof(in));
            temp = atoi(in);
        #endif
        *end = temp;
    }
    else
    {
        *end = location;
    }
    
}
//This reads wherever the pointer is currently at
void readCurr()
{
    #ifdef __pie__
        printf("%p: ", p);
        printf("%x \n", *p);
    #else
        printf(1, "%x: ", p);
        printf(1, "%x \n", *p);
    #endif
}
//This adds a passed amount to the current pointer
void incrementer(int amount)
{
    p += amount;
    #ifdef __pie__
        printf("%p: ", p);
    #else
        printf(1, "Pointer is now set to %p.\n", p);
    #endif
    printCompletion();
}

//This function writes from wherever the pointer already is to the given end pointer
//It will fill those spots with the given value
void memoryViolatorW(int value)
{
    while(p != end)
    {
        *p = value;
        p++;
    }
    printCompletion();
}

//This writes wherever the current pointer is with the given value
void singlewrite(int value)
{
    *p = value;
    printCompletion();
}

//-----MENU FUNCTIONS-----


void readMenu()
{
    char * menuString = "\n\n Read. What would you like to do?\n(1) Read the next 100 bytes\n(2) Read from a custom address\n(3) Read from your current address\n(0) Back to Main Menu\n\n";
    int n;
    #ifdef __pie__
        print(menuString);
        scanf("%d",n);
    #else
        printf(1,menuString);
        char integerthing[20];
        read(0,integerthing, sizeof(integerthing));
        n = atoi(integerthing);
    #endif
    char tmp [44]= "What address would you like to read from?\n";
    switch(n)
    {
        case 0:
            return;
            break;
        case 1:
            memoryViolatorR();
            return;
        case 2:

            #ifdef __pie__
                print(tmp);
                scanf("%d",n);
            #else
                printf(1,tmp);
                char integerthing[200];
                read(0,tmp, sizeof(integerthing));
                n = atoi(integerthing);
            #endif
            setPointer(n);
            readCurr();
            return;
        case 3:
            readCurr();
            return;
        default:
                #ifdef __pie__
                    print(error);
                    errorFlag = 1;
                    return;
                #else
                    printf(1,error);
                    exit();
                #endif
    }
}

void writeMenu()
{
    char * menuString = "Writing.\n\n What would you like to do?\n(1)Write a value to an ending location\n(2) Write until Crash \n(3)Write only at the current location\n(0) Main Menu";
    int n;
    #ifdef __pie__
        print(menuString);
        scanf("%d",n);
    #else
        printf(1,menuString);
        char integerthing[20];
        read(0,integerthing, sizeof(integerthing));
        n = atoi(integerthing);
    #endif
    switch(n)
    {
        case 1:
            setPointerE(-1);
            memoryViolatorW(fillValue);
            return;
        case 2:
            setPointerE(atoi(address[1]));
            memoryViolatorW(fillValue);
            return;
        case 3:
            singlewrite(fillValue);
            return;
        case 0:
            return;
        default:
            #ifdef __pie__
                print(error);
                errorFlag = 1;
                return;
            #else
                printf(1,error);
                exit();
            #endif
    }
}

void pointerMenu()
{
    char * menuString = "Where would you like to set your pointer to? Type in the corresponding integer.\n(1) 0\n(2) 0xffffff00\n(3) Main Address\n(4) Global Address\n(5) Heap Address\n(6) Stack Address\n(7) Custom Address\n";

    char addressIndex[40];
    #ifdef __pie__
        printf(menuString);
        scanf("%s", addressIndex);
    #else
        printf(1, menuString);
        read(0, addressIndex, sizeof(addressIndex));
    #endif
    p = address[atoi(addressIndex)];
    printCompletion();
}
void mainMenu()
{
    
    char * mainmenustring = "What would you like to do?\n(1) Read \n(2) Write\n(3) Change pointer location \n(4) Exit\n";
    int n;
    #ifdef __pie__
        print(mainmenustring);
        scanf("%d",n);
    #else
        printf(1,mainmenustring);
        char integerthing[20];
        read(0,integerthing, sizeof(integerthing));
        n = atoi(integerthing);
    #endif
    switch(n)
    {
        case 1:
            readMenu();
            break;
        case 2:
            writeMenu();
            break;
        case 3:
            pointerMenu();
            break;
        case 4:
            #ifdef __pie__
                return;
            #else
                exit();
            #endif
        default:
                #ifdef __pie__
                    print(error);
                    return;
                #else
                    printf(1,error);
                    exit();
                #endif
    }
    if(!errorFlag)
    {
        mainMenu();
    }
}

//-----MAIN FUNCTION-----
//Throws to the menu functions to complete the requested operations
//The menu functions handles the stuff
int main(int argc, char ** argv)
{
    * p = 0;
    address[0] = (char *)4294967040;
    address[1] = (char *)0;
    address[2] = (char *)&main;
    address[3] = (char *)&_end;
    address[4] = (char *)&ptr;
    address[5] = (char *)&argv;
    ptr = malloc(1);
    mainMenu();
    free(ptr);
    #ifdef __pie__
        return 0;
    #else
        exit();
    #endif

}