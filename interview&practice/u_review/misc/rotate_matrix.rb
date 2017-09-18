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


def rotate_cc_matrix(matrix)
  result = Array.new(matrix.length) {Array.new(matrix[0].length)}

  row = 0

  while row < matrix.length
    column = 0
    while column < matrix[row].length
      result[2 - column][row] = matrix[row][column]
      column += 1
    end
    row += 1
  end

  result
end

matrix = [
  [1,2,3], #[1,2] --> [0,1]
  [4,5,6], #[0,2] --> [0,0]
  [7,8,9]
]
new_matrix = [
  [7,4,1],
  [8,5,2],
  [9,6,3]
]

puts rotate_matrix(matrix) == new_matrix
p rotate_cc_matrix(matrix)
