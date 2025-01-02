#include <iostream>
#include <sstream>
#include <string>

#include "binary_heap.h"
using namespace std;

	// Test program
int main() {
	BinaryHeap<int> h;
	
	h.insert(1);
	h.insert(2);
	h.insert(2);
	h.insert(3);
	h.display();
	h.changePriority(2,4);
	h.display();

	return 0;
}
