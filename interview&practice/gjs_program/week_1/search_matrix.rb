# Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
#
# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous row.
# For example,
#
# Consider the following matrix:
#
# [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# Given target = 3, return true.

def matrix_exist?(matrix, target)
  return false if matrix.flatten.empty?
  return false if (matrix[0][0] > target || matrix[-1][-1] < target)

  idx = 0

  while idx < matrix.length
    if target > matrix[idx][0] && target < matrix[idx][-1]
      return binary_search(matrix[idx], target)
    elsif target == matrix[idx][0] || target == matrix[idx][-1]
      return true
    end

    idx += 1
  end

  false
end

def binary_search(array,target)


  middle_idx = array.length/2
  return true if array[middle_idx] == target
  return false if array.length < 2

  if array[middle_idx] > target
    return binary_search(array[0...middle_idx],target)
  else
    return binary_search(array[middle_idx..-1],target)
  end

end

matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
# How it works

# We iterate through the matrix rows until we find one that has the range
# of our target, then use binary search to look for a value. This takes
# O(logn) for the binary serach, where n is the length of the row, and O(m)
# for iterating through the array, where m is the number of rows. So the total
# cost is O(logn + m)

# puts matrix_exist?(matrix,3)
# puts matrix_exist?(matrix,1)
# puts matrix_exist?(matrix,50)
