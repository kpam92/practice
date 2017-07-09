# bubble sort

def bubble_sort(array)

  sorted = false

  until sorted

    idx = 0
    sorted = true

    while idx < array.length - 1

      if array[idx] > array[idx + 1]
        array[idx],array[idx + 1] = array[idx + 1], array[idx]
      end

      idx += 1
    end

  end
end
# merge sort

# quick sort

# heap sort
