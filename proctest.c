#include "types.h"
#include "stat.h"
#include "user.h"
// #include "proc.c" why do I get errors when I try to include this?

int main(int argc, char ** const argv)
{
    setpriority(0, 35);
    setpriority(1, 50);
    sleep(5000000);
 

    exit();
}