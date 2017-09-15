# Write a program that takes an array A and an index i into A,
#  and rearranges the elements such that all elements less than
#  A[i] (the 'pivot') appear first, followed by elements equal
#  to the pivot, followed by elements greater than the pivot.

def array_sorter(array,index)
  low_idx = 0
  equal = 0
  high_idx = array.length - 1
  pivot_element = array[index]

  while equal <= high_idx
    if array[equal] > pivot_element
      array[equal], array[high_idx] = array[high_idx],array[equal]
      high_idx -= 1
    elsif array[equal] == pivot_element
      equal += 1
    else # array[equal] < pivot_element
      array[equal], array[low_idx] = array[low_idx],array[equal]
      equal += 1
      low_idx += 1
    end
  end
  array
end
