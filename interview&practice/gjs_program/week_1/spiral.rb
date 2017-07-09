# Create a method that will traverse through a matrix(array of arrays)
# in a spiral fashion.
#
# [1,2,3,4]
# [11,12,13,5]
# [10,9,7,6]
#  will return 1,2,3,4,5,6,7,8,9,10,11,12,12


def spiralize(matrix)
  result = []
  visited = {}
  start = [0,0]
  length = matrix[0].length - 1
  depth = matrix.length - 1
  row,column = start
  while visited[[row,column]] != true
    # right
    while column < length
      visited[[row,column]] = true
      result << matrix[row][column]
      column += 1
    end
    # down
    while row < depth
      visited[[row,column]] = true
      result << matrix[row][column]
      row += 1
    end
    # left
    while column >= start[0]
      visited[[row,column]] = true
      result << matrix[row][column]
      column -= 1
    end
    # up

    while row > start[1]
      visited[[row,column]] = true
      result << matrix[row][column]
      row -= 1
    end
    start =  [row,column]
  end
end

puts spiralize([[1,2],[3,4]])
