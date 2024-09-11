#include "../inc/list_int_queue.h"

ListIntQueue::ListIntQueue() {
    max = queue.max_size();
    queue = std::list<int>();
}

ListIntQueue::~ListIntQueue() {
    delete &queue;
}

void ListIntQueue::enqueue(int x) {
    queue.push_front(x);
}

int ListIntQueue::dequeue() {
    int value = queue.back();
    queue.pop_back();
    return value;
}

bool ListIntQueue::empty() {
    return queue.empty();
}

bool ListIntQueue::full() {
    return max == queue.size();
}