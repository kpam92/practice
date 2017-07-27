# Given numRows, generate the first numRows of Pascal's triangle.
#
# For example, given numRows = 5,
# Return
#
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]


def pascal(n)
  result = []

  idx = 1
  while idx <= n
    result << Array.new(idx,1)
    idx += 1
  end

  idx1 = 0

  while idx1 < result.length
    idx2 = 0
    while idx2 < result[idx1].length
      if idx2 == 0 || idx2 == result[idx1].length - 1
      else
        result[idx1][idx2] = result[idx1 - 1][idx2 - 1] + result[idx1 - 1][idx2]
      end
      idx2 += 1
    end
    idx1 += 1
  end

  result
end
