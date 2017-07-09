# Create a method that will traverse through a matrix(array of arrays)
# in a spiral fashion.
#
# [1,2,3,4]
# [11,12,13,5]
# [10,9,7,6]
#  will return 1,2,3,4,5,6,7,8,9,10,11,12


# def spiralize(matrix)
#   result = []
#
#   until matrix.empty?
#     # top
#
#     result.concat(matrix[0])
#     matrix.shift(1)
#     # right
#     break if matrix.empty?
#     matrix.each do |row|
#       result << row.pop
#     end
#     # bottom
#     break if matrix.empty?
#     result.concat(matrix[matrix.length - 1].reverse)
#     matrix.pop
#     # left
#     break if matrix.empty?
#     next_row = []
#     matrix.each do |row|
#       next_row.unshift(row.shift)
#     end
#     result.concat(next_row)
#   end
#
#   result
# end
#
# matrix = [[1,2,3,4],[10,11,12,5],[9,8,7,6]]
# matrix = [[1,2],[3,4]]
# puts spiralize(matrix)

# def spiralize(matrix)
#   result = []
#   length = matrix[0].length
#   depth = matrix.length
#   n = 1
#   x,y = 0,0
#
#   until result.length == length * depth
#     # top
#     while y < length - n
#       result << matrix[x][y]
#       y += 1
#     end
#     # right
#     break if result.length == length * depth
#     while x < depth - n
#       result << matrix[x][y]
#       x += 1
#     end
#     # bottom
#     break if result.length == length * depth
#     while y >= n
#       result << matrix[x][y]
#       y -= 1
#     end
#     # left
#     break if result.length == length * depth
#     while x >= n
#       result << matrix[x][y]
#       x -= 1
#     end
#     n += 1
#     x += 1
#     y += 1
#     puts [x,y]
#   end
# result
#
# end

def spiralize(matrix)
  result = []
  top = 0
  bottom = matrix.length - 1
  left = 0
  right = matrix[0].length - 1
  direction = 'right'

  while (top <= bottom) && (left <= right)

    if direction == 'right'

      column = left
      while column <= right
        result << matrix[top][column]
        column += 1
      end
      top += 1
      direction = 'down'

    elsif direction == 'down'

      row = top
      while row <= bottom
        result << matrix[row][right]
        row += 1
      end
      right -= 1
      direction = 'left'

    elsif direction == 'left'
      column = right
      while column >= left
        result << matrix[bottom][column]
        column -= 1
      end
      bottom -= 1
      direction = 'up'

    elsif direction == 'up'

      row = bottom
      while row >= top
        result << matrix[row][left]
        row -= 1
      end
      left += 1
      direction = 'right'

    end
  end

  result
end


# How it works:

# This solution iterates through the matrix dependent on the direction,
# peeling away from the array by having variables for the top,bottom,left, and
# right boundaries of the remaining array. This solution takes O(1) space
# and O(n) time, where n is the amount of items.

# matrix = [[1,2,3,4],[10,11,12,5],[9,8,7,6]]
# matrix = [[1,2],[4,3]]
# matrix = [
#   [1,2,3,4,5],
#   [16,17,18,19,6],
#   [15,24,25,20,7],
#   [14,23,22,21,8],
#   [13,12,11,10,9]
# ]
# puts spiralize(matrix)
