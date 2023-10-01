#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdint.h>
#include <string.h>
#include "config.h"
#include "thpool.h"

void* thread_do_work(void* arg) {
    ThreadPool* pool = (ThreadPool*) arg;
    
    while (true) {
        pthread_mutex_lock(&(pool->lock));

        while ((pool->count == 0) && (!pool->stop)) {
            pthread_cond_wait(&(pool->condition), &(pool->lock));
        }

        if (pool->stop) {
            pthread_mutex_unlock(&(pool->lock));
            pthread_exit(NULL);
        }

        Job job = pool->jobQueue[pool->head];
        pool->head = (pool->head + 1) % pool->queueSize;
        pool->count -= 1;
        pool->working += 1;

        pthread_mutex_unlock(&(pool->lock));

        job.function(job.arg);

        pthread_mutex_lock(&(pool->lock));
        pool->working -= 1;
        if (pool->working == 0 && pool->count == 0) {
            pthread_cond_signal(&(pool->condition));
        }
        pthread_mutex_unlock(&(pool->lock));
    }

    return NULL;
}

ThreadPool* threadpool_create(int numThreads) {
    ThreadPool* pool = malloc(sizeof(ThreadPool));
    pool->threads = malloc(sizeof(pthread_t) * numThreads);
    pool->jobQueue = malloc(sizeof(Job) * QUEUE_SIZE);
    pool->queueSize = QUEUE_SIZE;
    pool->head = 0;
    pool->tail = 0;
    pool->count = 0;
    pool->working = 0;
    pool->stop = false;

    pthread_mutex_init(&(pool->lock), NULL);
    pthread_cond_init(&(pool->condition), NULL);

    for (int i = 0; i < numThreads; ++i) {
        pthread_create(&pool->threads[i], NULL, thread_do_work, pool);
    }

    return pool;
}

void threadpool_add_job(ThreadPool* pool, void (*function)(void* arg), void* arg) {
    pthread_mutex_lock(&(pool->lock));

    pool->jobQueue[pool->tail].function = function;
    pool->jobQueue[pool->tail].arg = arg;
    pool->tail = (pool->tail + 1) % pool->queueSize;
    pool->count += 1;

    pthread_cond_signal(&(pool->condition));
    pthread_mutex_unlock(&(pool->lock));
}

void threadpool_wait(ThreadPool* pool) {
    pthread_mutex_lock(&(pool->lock));

    while ((pool->count > 0) || (pool->working > 0)) {
        pthread_cond_wait(&(pool->condition), &(pool->lock));
    }

    pthread_mutex_unlock(&(pool->lock));
}

void threadpool_destroy(ThreadPool* pool) {
    pthread_mutex_lock(&(pool->lock));

    pool->stop = true;

    pthread_cond_broadcast(&(pool->condition));
    pthread_mutex_unlock(&(pool->lock));

    for (int i = 0; i < pool->queueSize; ++i) {
        pthread_join(pool->threads[i], NULL);
    }

    pthread_mutex_destroy(&(pool->lock));
    pthread_cond_destroy(&(pool->condition));

    free(pool->threads);
    free(pool->jobQueue);
    free(pool);
}

void print_task(void* arg) {
    printf("Thread %ld: %s\n", pthread_self(), (char*) arg);
    sleep(1);
}

// int main() {
//     ThreadPool* pool = threadpool_create(5);

//     for (int i = 0; i < 20; ++i) {
//         // threadpool_add_job(pool, print_task, "Hello from task");
//     }

//     threadpool_wait(pool);
//     threadpool_destroy(pool);

//     return 0;
// }

