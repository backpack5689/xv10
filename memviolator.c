#if def __pie__
#include <stdio.h>
#include <stdlib.h>
#else
#include "types.h"
#include "stat.h"
#include "user.h"
#endif
//if "if def __pie__" is defined, you are in linux world
//-----GLOBAL VARIABLES-----
char * p;
int size;

//-----MENU FUNCTIONS-----
/*
void mainMenu()
{
    char * mainmenustring = "What would you like to do?\n(1) Read \n(2) Write\n(3) Exit";
    int n;
    #if def __pie__
        print(mainmenustring);
    #else
        printf(1,mainmenustring);
        char * integerthing;
        read(0,integerthing, 4);
        n = atoi(integerthing);
    #endif
    switch(n)
    {

    }
}
*/
//-----MEMORY FUNCTIONS-----
void memoryViolatorR()
{
    int memoryData;
    #if def __pie__
        scanf
    #else
        read(*p, memoryData, size);

    #endif
}

void memoryViolatorW()
{

}

void main(int argc, char * argv)
{
    * p = atoi(argv[1]);
    size = atoi(argv[2]);
    
    //while(1)
    //    mainMenu();
}