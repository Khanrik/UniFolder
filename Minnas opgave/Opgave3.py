list = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 42, 43, 45, 47]

target = 42

def binary_search(array, target):
    size = len(array)
    left = 0
    right = size 
    index = (left + right) // 2
    while (array[index] != target):
        if target > array[index]:
            left = index
            index = (left + right) // 2
        else:
            right = index
            index = (left + right) // 2
    return index

print(binary_search(list, target))