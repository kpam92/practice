# Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
#
# For example,
# Given n = 3,
#
# You should return the following matrix:
# [
#  [ 1, 2, 3 ],
#  [ 8, 9, 4 ],
#  [ 7, 6, 5 ]
# ]

def spiralize(n)
  result = []
  row = []
  n.times { row << nil }
  n.times { result << row }

  top = 0
  bottom = n - 1
  left = 0
  right = n - 1

  direction = 'right'
  num = 1
  while top <= bottom && left <= right
    if direction == 'right'
      column = left
      while column <= right
        result[top][column] = num
        column += 1
        num += 1
      end
      top += 1
      direction = 'down'

    elsif direction == 'down'
      row = right
      while row <= bottom
        result[row][right] = num
        row += 1
        num += 1
      end
      right -= 1
      direction = 'left'
    elsif direction == 'left'
      column = right
      while column >= left
        result[bottom][column] = num
        column -= 1
        num += 1
      end
      bottom -= 1
      direction = 'up'

    elsif direction == 'up'
      row = bottom
      while row <= top
        result[row][left] = num
        row -= 1
        num += 1
      end
      left -= 1
      direction = 'right'
    end
  end

  result
end

puts spiralize(3)
