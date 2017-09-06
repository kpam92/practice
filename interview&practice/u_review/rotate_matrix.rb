# Rotate a matrix of numbers 90 degrees


def rotate_matrix(matrix)
  new_matrix = Array.new(matrix.length) do |column|
    column = Array.new(matrix[0].length)
  end

  matrix_row = 0
  while matrix_row < matrix.length
    matrix_column = 0
    while matrix_column < matrix[matrix_row].length

      new_matrix[matrix_column][matrix.length - matrix_row - 1] = matrix[matrix_row][matrix_column]
      matrix_column += 1
    end

    matrix_row += 1
  end

  new_matrix
end

matrix = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]
new_matrix = [
  [7,4,1],
  [8,5,2],
  [9,6,3]
]

puts rotate_matrix(matrix) == new_matrix
