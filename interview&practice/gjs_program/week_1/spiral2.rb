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

  while top <= bottom && left <= right
      if direction == 'right'
      elsif direction == 'down'
      elsif direction == 'left'
      elsif direction == 'up'
      end
  end
end
