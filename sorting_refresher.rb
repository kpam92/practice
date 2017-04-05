# a quick dive back into the various different manners of sorting.


# worst case: O(n^2)

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


# worst case: O(n(log)n)

def merge_sort(array,&prc)
  return array if array.length <= 1
  middle_idx = array.length / 2
  merge(merge_sort(array[0...middle_idx],&prc),merge_sort(array[middle_idx..-1]), &prc)
end

def merge(left,right,&prc)
  prc ||= proc {|num1, num2| num1 <=> num2}
  result = []
  until left.empty? || right.empty?
    case prc.call(left.first,right.first)
    when 1
      result.push(right.shift)
    when 0
      result.push(left.shift)
    when -1
      result.push(left.shift)
    end
  end
  result.concat(left).concat(right)
end



# worst case: O(n^2)

def quicksort(array)
  return array if array.length < 2

  pivot = array.first
  left,right = [],[]

  array.drop(1).each do |el|
    if el < pivot
      left << el
    else
      right << el
    end
  end

  return quicksort(left).concat([pivot]).concat(quicksort(right))

end
