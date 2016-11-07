# Write an algorithm such that if an element in an MxN matrix is zero,
# its entire row and column are set to zero.




def zero_matrix(matrix)
  zero_rows = []
  zero_columns = []

  row = 0

  while row < matrix.length
    idx = 0
    while idx < matrix[row].length

      if matrix[row][idx] == 0
        zero_rows.push(row)
        zero_columns.push(idx)
      end

      idx += 1
    end

    row += 1
  end

  zero_rows.each {|x| matrix[x].map {|y| y = 0}}

  matrix.each do |row|
    zero_columns.each do |column|
      row[column] = 0
    end
  end

  matrix
end
