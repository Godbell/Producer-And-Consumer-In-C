#include <pthread.h>
#include <stdio.h>
#include <semaphore.h>

sem_t full;
sem_t empty;
sem_t mutex;

void *s_thread_increment(void *arg);
void *s_thread_decrement(void *arg);