#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <sys/time.h>

// #define NUM_THREADS 10
#define ONE_MILLION 1000000

typedef struct node
{
    int val;
    struct node *next;
    pthread_mutex_t lock;
} node;

typedef struct list
{
    node *head;
    pthread_mutex_t lock;
} list;

typedef struct args
{
    struct list *list;
    int i;
} args;

void insert_node(list *l, int val)
{
    node *newnode = (node *)malloc(sizeof(node));
    if (newnode == NULL)
    {
        return;
    }
    newnode->val = val;
    newnode->next = NULL;
    pthread_mutex_init(&newnode->lock, NULL);

    pthread_mutex_lock(&l->lock);
    newnode->next = l->head;
    l->head = newnode;
    pthread_mutex_unlock(&l->lock);
}

int lookup(node *head, int key)
{
    node *cur = head;
    if (head == NULL)
    {
        return -1;
    }

    pthread_mutex_lock(&cur->lock);
    while (cur != NULL)
    {
        if (cur->val == key)
        {
            pthread_mutex_unlock(&cur->lock);
            return 1;
        }
        // lock next before unlocking current
        if (cur->next != NULL)
        {
            pthread_mutex_lock(&cur->next->lock);
        }
        pthread_mutex_unlock(&cur->lock);
        cur = cur->next;
    }
    return 0;
}

void *thread_wrapper(void *thread_arg)
{
    args *a = (args *)thread_arg;
    insert_node(a->list, a->i);
    // printf("running wrapper%d, \n", a->i);
}

void *thread_wrapper_lookup(void *thread_arg)
{
    args *a = (args *)thread_arg;
    lookup(a->list->head, a->i);
    // printf("running wrapper%d, \n", a->i);
}

int main(int argc, char *argv[])
{
    if (argc < 3)
    {
        printf("\nInsufficient args");
        return -1;
    }

    int NUM_THREADS = atoi(argv[1]);
    int LIST_SIZE = atoi(argv[2]);

    // init list
    list *l = (list *)malloc(sizeof(list));
    l->head = NULL;
    pthread_mutex_init(&l->lock, NULL);

    pthread_t threads[LIST_SIZE];

    for (int i = 0; i < LIST_SIZE; ++i)
    {
        args *thread_arg = (args *)malloc(sizeof(args)); // Allocate a new args struct for each thread, otherwise threads will share the same memory for args and can be overwritten
        thread_arg->list = l;
        thread_arg->i = i;
        if (pthread_create(&threads[i], NULL, &thread_wrapper, thread_arg) != 0)
        {
            printf("Error creating threads");
            return -1;
        }
    }

    // Wait for all threads to finish
    for (int i = 0; i < LIST_SIZE; ++i)
    {
        pthread_join(threads[i], NULL);
    }

    // iterate over list
    node *temp = l->head;
    while (temp != NULL)
    {
        // printf("%d \n", temp->val);
        temp = temp->next;
    }

    // start timer
    int s = 0;
    struct timeval start, end;
    s = gettimeofday(&start, NULL);

    for (int i = 0; i < NUM_THREADS; ++i)
    {
        args *thread_arg = (args *)malloc(sizeof(args)); // Allocate a new args struct for each thread, otherwise threads will share the same memory for args and can be overwritten
        thread_arg->list = l;
        thread_arg->i = i;
        if (pthread_create(&threads[i], NULL, &thread_wrapper_lookup, thread_arg) != 0)
        {
            printf("Error creating threads");
            return -1;
        }
    }

    // Wait for all threads to finish
    for (int i = 0; i < NUM_THREADS; ++i)
    {
        pthread_join(threads[i], NULL);
    }

    // end timer
    s = gettimeofday(&end, NULL);
    long long startusec, endusec;
    startusec = start.tv_sec * ONE_MILLION + start.tv_usec;
    endusec = end.tv_sec * ONE_MILLION + end.tv_usec;

    printf("time (seconds): %lf\n\n",
           ((double)(endusec - startusec) / ONE_MILLION));

    return 0;
}