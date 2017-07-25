# You are climbing a stair case. It takes n steps to reach to the top.
#
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
#
# Note: Given n will be a positive integer.


def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2

  climb_stairs(n - 1) + climb_stairs(n - 2)
end


# this solution uses a recursive approach to figure out the answer. But this
# fails when I get to the input of 38. So let's try a bottom-up approach.


def climb_stairs(n)
end

# puts climb_stairs(38)
# puts climb_stairs(4)
# puts climb_stairs(5)
