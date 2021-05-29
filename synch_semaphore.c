#include <pthread.h>
#include <stdio.h>
#include <semaphore.h>

#define ITER 1000
#define BUFFER_SIZE 30

int insert_item(int *item);
int remove_item(int *item);
void *thread_increment(void *arg);
void *thread_decrement(void *arg);

int x = 0; // count, max 29
int in = 0;
int out = 0;
int buffer[BUFFER_SIZE];
sem_t full;
sem_t empty;
sem_t mutex;

int main() {
    pthread_t tid1, tid2;

    // initialize semaphore
    sem_init(&full, 0, 0);
    sem_init(&empty, 0, BUFFER_SIZE);
    sem_init(&mutex, 0, 1);

    pthread_create(&tid1, NULL, thread_increment, NULL);
    pthread_create(&tid2, NULL, thread_decrement, NULL);
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    if (x != 0)
        printf("BOOM! counter=%d\n", x);
    else
        printf("OK counter=%d\n", x);
}

/* thread routine */
void * thread_increment (void *arg) {
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

void * thread_decrement (void *arg) {
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