#include <pthread.h>
#include <stdio.h>
#include <semaphore.h>
#include "synch_semaphore.h"
#include "threading_variables.h"

#define ITER 1000

int s_main() {
    pthread_t tid1, tid2;

    // initialize semaphore
    sem_init(&full, 0, 0);
    sem_init(&mutex, 0, 1);

    pthread_create(&tid1, NULL, s_thread_increment, NULL);
    pthread_create(&tid2, NULL, s_thread_decrement, NULL);
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    if (x != 0)
        printf("BOOM! counter=%d\n", x);
    else
        printf("OK counter=%d\n", x);

    sem_destroy(&full);
    sem_destroy(&empty);
    sem_destroy(&mutex);
}

void * s_thread_increment (void *arg) {
    int i, val;
    for (i=0; i< ITER ; i++) {
        sem_wait(&empty);
        sem_wait(&mutex);

        val = x;
        buffer[in] = val;
        printf("%u: %d\n", (unsigned int) pthread_self(), val);

        x = val + 1;
        in = (in + 1) % BUFFER_SIZE;

        sem_post(&mutex);
        sem_post(&full);
    }
    return NULL;
}

void * s_thread_decrement (void *arg) {
    int i, val;
    for (i = 0; i < ITER; i++) {
        sem_wait(&full);
        sem_wait(&mutex);

        val = x;
        printf("%u: %d\n", (unsigned int) pthread_self(), val);

        x = val - 1;
        out = (out + 1) % BUFFER_SIZE;

        sem_post(&mutex);
        sem_post(&empty);
    }
    return NULL;
}