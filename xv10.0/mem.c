#include "types.h"
#include "stat.h"
#include "user.h"

int global = 0;

int main(int argc, char *argv[])
{
    if (argc != 2) {
        printf(1, "usage: mem <string>\n");
        return 0;
    }

    while (1) {
        printf(1, "%s: [%p]=%d\n",argv[1],&global,global); 
        global++;
        sleep(1);
    }

    exit();
}
