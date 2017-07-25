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


def climb_stairs_bottom_up(n)

  t = Array.new(n + 1, 0)

  climb_helper(n,t)
end

def climb_helper(n,t)
  return t[n] if t[n] > 0

  if n == 0 || n == 1
    t[n] = 1
  else
    t[n] = climb_helper(n - 1,t) + climb_helper(n - 2, t)
  end
  t[n]
end

# This bottom-up solution keeps an array of all the values' output so that
# it doesn't have to keep recalculating the same functions over and over again

# puts climb_stairs_bottom_up(38)
# puts climb_stairs(4)
# puts climb_stairs(5)
