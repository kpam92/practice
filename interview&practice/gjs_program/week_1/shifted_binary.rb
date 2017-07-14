# A sorted array of distinct integers shiftArr is shifted to the left by an unknown offset and you don’t have a pre-shifted copy of it. For instance, the sequence 1, 2, 3, 4, 5 becomes 3, 4, 5, 1, 2, after shifting it twice to the left.
#
# Given shiftArr and an integer num, implement a function shiftedArrSearch that finds and returns the index of num in shiftArr. If num isn’t in shiftArr, return -1. Assume that the offset doesn’t equal to 0 (i.e. assume the array is shifted at least once) or to arr.length - 1 (i.e. assume the shifted array isn’t fully reversed).
#
# Explain your solution and analyze its time and space complexities.


def shifted_array_search(array,target)
end

def shift_array(array)

  middle_idx = array.length/2

  left_idx = 1
  right_idx = array.length - 1

  until array[middle_idx - 1] > array[middle_idx]
    if array[0] > array[middle_idx]
      right_idx = middle_idx + 1
    elsif array[0] < array[middle_idx]
      left_idx = middle_idx - 1
    end
    middle_idx = left_idx + ((right_idx - left_idx)/2)
  end

end
