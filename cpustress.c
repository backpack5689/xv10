#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
    int i, j = 1;
    int k;
    while(1)
    {
        k = i + j;
        j = i;
        i = k;
    }

    exit();
}
