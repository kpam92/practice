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
