



def quick_sort(arr):
    if len(arr) <= 1:
        return arr

    pivot = arr[0]
    
    less_than_pivot = [x for x in arr if x < pivot]
    greater_than_pivot = [x for x in arr if x > pivot]

    return quick_sort(less_than_pivot) + [pivot] + quick_sort(greater_than_pivot)

arr = [33, 14, 27, 10, 35, 19, 42, 44, 12, 25, 6, 39]
sorted_arr = quick_sort(arr)
print(sorted_arr))