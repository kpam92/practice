# a quick dive back into the various different manners of sorting.

def bubble_sort(array)

  sorted = false
  until sorted
    sorted = true
    idx = 0
    while idx < array.length
      if array[idx] > array[idx + 1]
        sorted = false
        array[idx],array[idx + 1] = array[idx + 1], array[idx1]
      end
      idx += 1
    end

  end
  array
end
