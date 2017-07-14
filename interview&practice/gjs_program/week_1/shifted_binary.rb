# A sorted array of distinct integers shiftArr is shifted to the left by an unknown offset and you don’t have a pre-shifted copy of it. For instance, the sequence 1, 2, 3, 4, 5 becomes 3, 4, 5, 1, 2, after shifting it twice to the left.
#
# Given shiftArr and an integer num, implement a function shiftedArrSearch that finds and returns the index of num in shiftArr. If num isn’t in shiftArr, return -1. Assume that the offset doesn’t equal to 0 (i.e. assume the array is shifted at least once) or to arr.length - 1 (i.e. assume the shifted array isn’t fully reversed).
#
# Explain your solution and analyze its time and space complexities.


def shifted_array_search(array,target)
  start_index = shift_array(array)
  array = array.map.with_index {|x,idx| x = [x,idx]}
  array = array[start_index..-1].concat(array[0...start_index])

  result_index = binary_search(array, target)
  return -1 if result_index == -1
  array[result_index][1]

end

def binary_search(array,target)
  middle_idx = array.length/2

  return middle_idx if array[middle_idx][0] == target
  return -1 if array.length < 2

  if array[middle_idx][0] > target
    return binary_search(array[0...middle_idx],target)
  else
    curr_result = binary_search(array[middle_idx..-1],target)
    return -1 if curr_result == -1
    return middle_idx + curr_result
  end

end
# puts binary_search([1,2,3,4,5,6,7,8,9],1) # 0
# puts binary_search([1,2,3,4,5,6,7,8,9],9) # 8
# puts binary_search([1,2,3,4,5,6,7,8,9],7) # 6
# puts binary_search([1,2,3,4,5,6,7,8,9],3) # 2
# puts binary_search([1,2,3,4,5,6,7,8,9],100) # -1
# puts binary_search([1,2,3,4,5,6,7,8,9],-1) # -1



def shift_array(array)

  middle_idx = array.length/2

  left_idx = 1
  right_idx = array.length - 1

  until array[middle_idx - 1] > array[middle_idx]
    if array[0] > array[middle_idx]
      right_idx = middle_idx - 1
    elsif array[0] < array[middle_idx]
      left_idx = middle_idx + 1
    end
    middle_idx = left_idx + ((right_idx - left_idx)/2)
  end

  middle_idx

end
# puts shift_array([4,5,6,7,8,9,10,11,12,13,14,15,16,1])








# puts shifted_array_search([9, 12, 17, 2, 4, 5],1)
# puts shifted_array_search([9, 12, 17, 2, 4, 5],100)
# puts shifted_array_search([9, 12, 17, 2, 4, 5],9)
# puts shifted_array_search([9, 12, 17, 2, 4, 5],12)
# puts shifted_array_search([9, 12, 17, 2, 4, 5],17)
# puts shifted_array_search([9, 12, 17, 2, 4, 5],2)
# puts shifted_array_search([9, 12, 17, 2, 4, 5],4)
# puts shifted_array_search([9, 12, 17, 2, 4, 5],5)
