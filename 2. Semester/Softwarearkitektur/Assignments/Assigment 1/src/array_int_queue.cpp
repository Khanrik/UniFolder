#include "../inc/array_int_queue.h"
#include <assert.h>

ArrayIntQueue::ArrayIntQueue(int size){
    queue = new int[size];
    max = size;
    rear = 0;
}

ArrayIntQueue::~ArrayIntQueue(){
    delete[] queue;
}

void ArrayIntQueue::enqueue(int x) {
    assert(rear < max);

    queue[rear] = x;
    rear++;
}

int ArrayIntQueue::dequeue() {
    assert(rear > 0);

    int value = queue[0];

    for (int i = 0; i < rear; i++) {
        queue[i] = queue[i + 1];
    }
    queue[rear] = 0;
    rear--;

    return value;
}

bool ArrayIntQueue::empty() {
    return rear == 0;
}

bool ArrayIntQueue::full() {
    return rear == max;
}
