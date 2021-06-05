#include <pthread.h>
#include <stdio.h>

pthread_mutex_t mutex;
pthread_cond_t buffer_has_space;
pthread_cond_t buffer_has_data;

void *thread_increment(void *arg);
void *thread_decrement(void *arg);