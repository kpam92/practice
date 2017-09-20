=begin
4/5 Round at Uber
Coding: Given a 2D array of either '\' or '/', find out how many pieces this rectangle is divided into graphically.
For a 2X2 matrix with
/\
\/
The matrix split into 5 pieces - the diamond in middle and the four corners. Return 5 as the answer.


5/5 Round at Uber
Design Excel.
=end

def shape_checker(matrix)
  count = 0

  idx1 = 0
  while idx1 < matrix.length
    idx2 = 0
    while idx2 < matrix[idx].length
      if matrix[idx1][idx2][0] != '='
        count += 1
        fill_in_shape(matrix,idx1,idx2,'left')
      end

      if matrix[idx1][idx2][-1] != '='
        count += 1
        fill_in_shape(matrix,idx1,idx2,'right')
      end

      idx2 += 1
    end

    idx1 += 1
  end

  count
end

def fill_in_shape(matrix,row,column,side)
  if side == 'left'
    matrix[row][column] = '=' + matrix[row][column]
    if matrix[row][column][1] == '\\'
      #check down
      if (row < matrix.length - 1) && matrix[row+1][column][0] == '/'
        fill_in_shape(matrix,row+1,column,'left')
      end
      #check left
      if (column > 0) && matrix[row][column - 1][-1] == '/'
        fill_in_shape(matrix,row,column - 1,'right')
      end
    else # == '/'
      #check up
      if (row > 0) && matrix[row-1][column][0] == '\\'
        fill_in_shape(matrix,row+1,column,'left')
      end
      #check left
      if (column > 0) && matrix[row][column - 1][-1] == '\\'
        fill_in_shape(matrix,row,column - 1,'right')
      end
    end
  else # side == 'right'
    matrix[row][column] += '='
    if matrix[row][column][-2] == '\\'
      #check up
      if (row > 0) && matrix[row-1][column][-1] == '/'
        fill_in_shape(matrix,row-1,column,'right')
      end
      #check right
      if ( column < matrix[row].length - 1) && matrix[row][column+1][0] == '/'
        fill_in_shape(matrix,row,column+1,'left')
      end
    else # == '/'
      #check down
      if (row < matrix.length - 1) && matrix[row+1][column][0] == '\\'
        fill_in_shape(matrix,row+1,column,'right')
      end
      #check right
      if ( column < matrix[row].length - 1) && matrix[row][column+1][0] == '\\'
        fill_in_shape(matrix,row,column+1,'left')
      end
    end
  end
end
matrix = [
  ['/','\\'],
  ['\\','/']
]
puts shape_checker(matrix)
