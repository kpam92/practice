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
  return false if (matrix[0][0] > target || matrix[-1][-1])

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
end
