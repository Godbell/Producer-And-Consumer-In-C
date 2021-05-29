#include "synch_mutex.h"
#include "threading_variables.h"

#define ITER 1000

int main() {
    pthread_t tid1, tid2;

    pthread_mutex_init(&mutex, NULL);
    pthread_cond_init(&buffer_has_space, NULL);
    pthread_cond_init(&buffer_has_data, NULL);

    pthread_create(&tid1, NULL, p_thread_increment, NULL);
    pthread_create(&tid2, NULL, p_thread_decrement, NULL);
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    if (x != 0)
        printf("BOOM! counter=%d\n", x);
    else
        printf("OK counter=%d\n", x);

    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&buffer_has_space);
    pthread_cond_destroy(&buffer_has_data);

    return 0;
}
void * p_thread_increment (void *arg) {
    int i, val;
    for (i=0; i< ITER ; i++) {
        pthread_mutex_lock(&mutex);

        if (x == BUFFER_SIZE)
        {
            pthread_cond_wait(&buffer_has_space, &mutex);
        }

        val = x;
        buffer[in] = val;
        printf("%u: %d\n", (unsigned int) pthread_self(), val);

        x = val + 1;
        in = (in + 1) % BUFFER_SIZE;

        pthread_cond_signal(&buffer_has_data);
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}

void * p_thread_decrement (void *arg) {
    int i, val;
    for (i = 0; i < ITER; i++) {
        pthread_mutex_lock(&mutex);

        if (x == 0)
        {
            pthread_cond_wait(&buffer_has_data, &mutex);
        }

        val = x;
        printf("%u: %d\n", (unsigned int) pthread_self(), val);

        x = val - 1;
        out = (out + 1) % BUFFER_SIZE;

        pthread_cond_signal(&buffer_has_space);
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}