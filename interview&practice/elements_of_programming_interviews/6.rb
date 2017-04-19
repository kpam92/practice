# Write a program that takes an array A and an index i into A,
#  and rearranges the elements such that all elements less than
#  A[i] (the 'pivot') appear first, followed by elements equal
#  to the pivot, followed by elements greater than the pivot.

# first-attempt

def array_sorter(array,index)
  pivot = array[index]
  less,equal,greater = [],[],[]
  until array.empty?
    if array[0] < pivot
      less << array.shift
    elsif array[0] > pivot
      greater << array.shift
    else
      equal << array.shift
    end
  end
  less.concat(equal).concat(greater)
end

# This method has three seperate empty arrays, then iterates through
# the array, and splits up the numbers accordingly. It iterates through
# the array, so time complexity is O(n); numbers are moved around instead
# of copied, so space complexity is O(1)

# This can be improved in terms of space by doing everything in place.
# So instead of sorting into three subarrays to concat later, let's just
# work with the single array


def array_sorter(array,index)
end
