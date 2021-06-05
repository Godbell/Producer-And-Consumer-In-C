#include <pthread.h>
#include <stdio.h>
#include <semaphore.h>

sem_t full;
sem_t empty;
sem_t mutex;

void *thread_increment(void *arg);
void *thread_decrement(void *arg);