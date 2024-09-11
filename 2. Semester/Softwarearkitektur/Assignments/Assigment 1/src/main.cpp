#include <iostream>
#include "../inc/array_int_queue.h"
#include "../inc/list_int_queue.h"

int main() {
    ArrayIntQueue arr_queue(10);
    arr_queue.enqueue(1);
    arr_queue.enqueue(2);

    std::cout << arr_queue.dequeue() << std::endl;
    std::cout << arr_queue.dequeue() << std::endl;

    delete &arr_queue;



    ListIntQueue list_queue;
    list_queue.enqueue(1);
    list_queue.enqueue(2);

    std::cout << list_queue.dequeue() << std::endl;
    std::cout << list_queue.dequeue() << std::endl;

    delete &list_queue;



    std::cout << "Test passed" << std::endl;

    return 0;
}