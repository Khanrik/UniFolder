#ifndef _BINARY_HEAP_H_
#define _BINARY_HEAP_H_

#include <stdexcept>
#include <vector>
#include <iostream>

using namespace std;

template <typename Comparable>
class BinaryHeap
{
private:
	int currentSize;		  // Number of elements in heap
	vector<Comparable> array; // The heap array

	void buildHeap();
	void minHeapify(int hole);

public:
	BinaryHeap(int capacity = 100) : array(capacity + 1), currentSize(0) {};

	BinaryHeap(const vector<Comparable> &items)
	{
		array.resize(items.size() + 10);
		for (int i = 0; i < items.size(); ++i)
			array[i + 1] = items[i];
		currentSize = items.size() + 1;
		buildHeap();
	}

	bool isEmpty() const { return currentSize == 0; }

	void insert(const Comparable &x);
	const Comparable &findMin() const;
	void deleteMin();
	void deleteMin(Comparable &minItem);
	void changePriority(Comparable fromP, Comparable toP)
	{
		vector<Comparable> tempList;
		for (; currentSize > 0; )
		{
			if (findMin() == fromP)
			{
				break;
			}

			Comparable minVal;
			deleteMin(minVal);
			tempList.push_back(minVal);
		}

		while (findMin() == fromP)
		{
			deleteMin();
			insert(toP);
		}

		for (auto val : tempList)
		{
			insert(val);
		}
	}
	void display()
	{
		vector<Comparable> tempList;
		for (; currentSize > 0; )
		{
			Comparable minVal;
			deleteMin(minVal);
			tempList.push_back(minVal);
		}

		for (auto val : tempList)
		{
			std::cout << val << ", ";
			insert(val);
		}
		std::cout << std::endl;
	}
};

#include "binary_heap.tpp"

#endif
