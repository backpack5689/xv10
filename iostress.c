#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
    int k = 0;
    while(k < 999999999)
    {
        printf(1, "a");
        k++;
    }

    exit();
}
