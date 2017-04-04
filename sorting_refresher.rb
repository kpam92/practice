# a quick dive back into the various different manners of sorting.

def bubble_sort(array)
  sorted = false

  # this loop will run until the entire array is sorted
  until sorted
    sorted = true
    idx = 0
    while idx < array.length - 1
      if array[idx] > array[idx + 1]
        # if unsorted numbers found, array is marked unsorted
        # for this pass, and numbers are switched
        sorted = false
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
      end
      idx += 1
    end

  end
  array
end
