# There are N number of houses in a straight line. House at index i has valuables worth V[i].
# A thief is planning to rob as many houses as possible on this straight line.
# Constraint : If he robs house at index i, then he cannot rob houses at indices (i - 1) and (i + 1).
# Maximize the total value of valuables which he can rob.

def rob(array)
  return 0 if array.empty?
  return array[0] if array.length == 1
  return array.max if array.length == 2
  result = Array.new(array.length + 1) {0}
  result[1] = array[0]
  result[2] = array[1]
  idx = 0

  while idx < result.length
    result[idx] = [result[idx - 2],result[idx - 3]].max + nums[idx - 1]
    idx += 1
  end
  result[-2..-1].max
end
=begin
[2,0,4,3,10]

 2   6 5 16

=end
