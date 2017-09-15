# Write a program that takes an array A and an index i into A,
#  and rearranges the elements such that all elements less than
#  A[i] (the 'pivot') appear first, followed by elements equal
#  to the pivot, followed by elements greater than the pivot.



# [1,6,2,8,3,7,4,5,9]
#    L
#              H
#    E
#          I
def array_sorter(array,index)
  low_idx = 0
  equal = 0
  high_idx = array.length - 1

  while equal <= high_idx
    if array[equal] > array[index]
      array[equal],array[high_idx] = array[high_idx],array[equal]
      high_idx -= 1
    elsif array[equal] == array[index]
      equal += 1
    else
      array[equal], array[low_idx] = array[low_idx],array[equal]
      equal += 1
      low_idx += 1
    end
  end
  array
end
