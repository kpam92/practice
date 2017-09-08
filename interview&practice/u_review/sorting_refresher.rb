# merge sort


def merge_sort(array)

  return array if array.length < 2
  halfway = array.length / 2
  array1 = array[0...halfway]
  array2 = array[halfway..-1]

  merge_helper(merge_sort(array1),merge_sort(array2))

end

def merge_helper(array1,array2)
  result = []

  until array1.empty? || array2.empty?
    if array1[0] > array2[0]
      result.push(array2.shift)
    else
      result.push(array1.shift)
    end
  end

  result.concat(array1).concat(array2)
end

# puts merge_sort([1,5,2,3,9,4,8,5,7,6])

def bubble_sort(array)

  sorted = false

  until sorted

    sorted = true
    idx = 0
    while idx < array.length - 1
      if array[idx] > array[idx + 1]
        array[idx],array[idx + 1] = array[idx + 1], array[idx]
        sorted = false
      end
      idx += 1
    end
  end
  array
end
# puts bubble_sort([1,5,2,3,9,4,8,5,7,6])

def quick_sort(array)
  return array if array.length < 2
  pivot = [array.shift]
  left = []
  right = []

  until array.empty?
    if array[0] > pivot[0]
      right.push(array.shift)
    elsif array[0] < pivot[0]
      left.push(array.shift)
    else
      pivot.push(array.shift)
    end
  end

  quick_sort(left) + pivot + quick_sort(right)
end

# puts quick_sort([1,5,2,3,9,4,8,5,7,6])
