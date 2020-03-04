#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
    if (argc != 2) {
        printf(1, "usage: cpu <string>\n");
        exit();
    }

    while (1) {
        sleep(1);
        printf(1, "%s\n",argv[1]);
    }

    exit();
}
