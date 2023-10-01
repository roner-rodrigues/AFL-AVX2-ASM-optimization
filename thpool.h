// threadpool.h

#ifndef THREADPOOL_H
#define THREADPOOL_H

#include <pthread.h>
#include <stdbool.h>
#include <stdint.h>

#define QUEUE_SIZE  100
#define NUM_THREADS 2

// Estrutura que representa uma tarefa a ser executada pelo pool de threads.
typedef struct job {
    void (*function)(void* arg);
    void* arg;
} Job;

// Estrutura que representa o pool de threads.
typedef struct threadpool {
    pthread_mutex_t lock;
    pthread_cond_t condition;
    pthread_t* threads;
    Job* jobQueue;
    int queueSize;
    int head;
    int tail;
    int count;
    int working;
    bool stop;
} ThreadPool;

// Estrutura de trabalho que contém informações para cada thread processar a funcionalidade `has_new_bits`.
typedef struct {
    uint8_t* bitmap_start;  // Início do segmento do bitmap que esta thread irá processar.
    uint8_t* shared_ret;    // Buffer compartilhado para armazenar os resultados de local_ret.
    int segment_size;       // Tamanho do segmento que a thread irá processar.
    int offset;             // Offset no buffer compartilhado para esta thread escrever seu resultado.
} WorkData;

/**
 * Cria um novo pool de threads.
 * 
 * @param numThreads Número de threads no pool.
 * @return Retorna um ponteiro para o pool de threads.
 */
ThreadPool* threadpool_create(int numThreads);

/**
 * Adiciona uma tarefa ao pool de threads.
 * 
 * @param pool Ponteiro para o pool de threads.
 * @param function Função a ser executada pela tarefa.
 * @param arg Argumentos para a função.
 */
void threadpool_add_job(ThreadPool* pool, void (*function)(void* arg), void* arg);

/**
 * Espera até que todas as tarefas no pool de threads sejam concluídas.
 * 
 * @param pool Ponteiro para o pool de threads.
 */
void threadpool_wait(ThreadPool* pool);

/**
 * Destroi o pool de threads e libera os recursos associados.
 * 
 * @param pool Ponteiro para o pool de threads.
 */
void threadpool_destroy(ThreadPool* pool);

#endif
