#include "synch_pthread.h"
#include "synch_semaphore.h"

int main(int argc, char *argv[])
{
    if (*argv[0] == 's')        // sync with semaphore
    {
        s_main();
    }
    else if (*argv[0] == 'p')   // sync with mutex
    {
        p_main();
    }
}