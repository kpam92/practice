# Given an array, move all zeros to the end. The order of non-zero elements does not matter. Ex:
#
# move_zeros([1, 2, 0, 3, 4, 0, 5, 6, 0]) == [1, 2, 6, 3, 4, 5, 0, 0, 0]
# Algorithm should be O(n); use O(1) extra space.

def move_zeros(array)

  last_non_zero_idx = array.length - 1

  until array[last_non_zero_idx] != 0
    last_non_zero_idx -= 1
  end

  idx = 0

  while idx < last_non_zero_idx
    if array[idx] == 0
      array[idx], array[last_non_zero_idx] = array[last_non_zero_idx], array[idx]

      last_non_zero_idx -= 1
    end

    idx += 1
  end

  array
end

# Implement the 'look and say' function. 'Look and say' takes an input array and outputs an array that describes the count of the elements in the input array as they appear in order.

def look_and_say(array)
  result = []

  idx = 1
  curr_num = array[0]
  curr_times = 1

  return [[curr_times,curr_num]] if array.length == 1
  while idx < array.length
    if array[idx] == curr_num
      curr_times += 1
    else
      result << [curr_times,curr_num]
      curr_num = array[idx]
      curr_times = 1

    end

    if idx == array.length - 1
      result << [curr_times, curr_num]
    end

    idx += 1
  end

  result
end
