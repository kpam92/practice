# Given a square matrix in the form of a 2D array-of-arrays, return an array consisting of the values of the array in "spiral order" (top row, then right hand side, then bottom in reverse, then up, the back again...).

def print_spiral(matrix)
  top = 0
  bottom = matrix.length - 1
  left = 0
  right = matrix[0].length - 1
  result = []
  while top <= bottom && right <= right

    curr_left = left
    while curr_left <= right
      result.push(matrix[top][curr_left])
      curr_left += 1
    end
    top += 1

    break if top > bottom || left > right

    curr_top = top
    while curr_top <= bottom
      result.push(matrix[curr_top][right])
      curr_top += 1
    end
    right -= 1

    break if top > bottom || left > right

    curr_right = right
    while curr_right >= left
      result.push(matrix[bottom][curr_right])
      curr_right -= 1
    end
    bottom -= 1

    break if top > bottom || left > right

    curr_bottom = bottom
    while curr_bottom >= top
      result.push(matrix[curr_bottom][left])
      curr_bottom -= 1
    end
    left += 1

  end

  result
end

matrix = [
  [1,2,3],
  [8,9,4],
  [7,6,5]
]

puts print_spiral(matrix)
