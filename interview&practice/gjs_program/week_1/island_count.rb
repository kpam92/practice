# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
#
# Example 1:
#
# 11110
# 11010
# 11000
# 00000
# Answer: 1
#
# Example 2:
#
# 11000
# 11000
# 00100
# 00011
# Answer: 3


def island_count(matrix)

  island_count = 0

  row = 0

  while row < matrix.length
    column = 0
    while column < matrix[row].length
      if matrix[column][row] == 1

        island_count += 1
        matrix = sink_island(row, column, matrix)
      end
      column += 1
    end

    row += 1
  end
end

def sink_island(row, column, map)
  map[row][column] = 0

  # north
  if map[row-1][column] == 1
    map = sink_island(row-1, column, map)
  end
  # south
  if map[row+1][column] == 1
    map = sink_island(row+1, column, map)
  end
  # east
  if map[row][colum+1] == 1
    map = sink_island(row, column+1, map)
  end
  # west
  if map[row][colum-1] == 1
    map = sink_island(row, column-1, map)
  end

  map
end


world_1 = [[11110],[11010],[11000],[00000]]
puts island_count(world_1)
