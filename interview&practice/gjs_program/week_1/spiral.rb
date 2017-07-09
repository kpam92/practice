# Create a method that will traverse through a matrix(array of arrays)
# in a spiral fashion.
#
# [1,2,3,4]
# [11,12,13,5]
# [10,9,7,6]
#  will return 1,2,3,4,5,6,7,8,9,10,11,12


# def spiralize(matrix)
#   result = []
#
#   until matrix.empty?
#     # top
#
#     result.concat(matrix[0])
#     matrix.shift(1)
#     # right
#     break if matrix.empty?
#     matrix.each do |row|
#       result << row.pop
#     end
#     # bottom
#     break if matrix.empty?
#     result.concat(matrix[matrix.length - 1].reverse)
#     matrix.pop
#     # left
#     break if matrix.empty?
#     next_row = []
#     matrix.each do |row|
#       next_row.unshift(row.shift)
#     end
#     result.concat(next_row)
#   end
#
#   result
# end
#
# matrix = [[1,2,3,4],[10,11,12,5],[9,8,7,6]]
# matrix = [[1,2],[3,4]]
# puts spiralize(matrix)

def spiralize(matrix)
end
