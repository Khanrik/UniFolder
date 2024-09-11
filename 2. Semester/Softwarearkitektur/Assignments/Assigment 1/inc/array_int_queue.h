#pragma once
#include "int_queue.h"

class ArrayIntQueue : public IntQueue {
private:
    int max;
    int rear;
    int *queue;
public:
    void enqueue(int) override;
    int dequeue() override;
    bool empty() override;
    bool full() override;
    ArrayIntQueue(int);
    ~ArrayIntQueue();
};