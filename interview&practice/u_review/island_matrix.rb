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
require 'byebug'

def island_count(matrix)
  idx1 = 0
  result = 0
  while idx1 < matrix.length
    idx2 = 0
    while idx2 < matrix[idx1].length
      if matrix[idx1][idx2] == 1
        result += 1
        sink_island(matrix, idx1, idx2)
      end

      idx2 += 1
    end

    idx1 += 1
  end

  result
end

def sink_island(map, row, column)

  map[row][column] = 0
  # sink north
  if row > 0 && map[row - 1][column] == 1
    sink_island(map, row - 1, column)
  end
  # sink south
  if row < map.length - 1 && map[row + 1][column] == 1
    sink_island(map, row + 1, column)
  end
  # sink east
  if column < map[row].length - 1 && map[row][column + 1] == 1
    sink_island(map, row, column + 1)
  end
  # sink west
  if column > 0 && map[row][column - 1] == 1
    sink_island(map, row, column - 1)
  end
end
map1 = [[1,1,1,1,0],
        [1,1,0,1,0],
        [1,1,0,0,0],
        [0,0,0,0,0]]

map2 = [[1,1,0,0,0],
        [1,1,0,0,0],
        [0,0,1,0,0],
        [0,0,0,1,1]]

puts island_count(map1)
puts island_count(map2)
