#pragma once
#include "int_queue.h"
#include <list>

class ListIntQueue : public IntQueue {
private:
    int max;
    std::list<int> queue;
public:
    void enqueue(int) override;
    int dequeue() override;
    bool empty() override;
    bool full() override;
    ListIntQueue();
    ~ListIntQueue();
};