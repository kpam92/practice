# Many times, we need to re-implement basic functions without using any standard library functions already implemented. For example, when designing a chip that requires very little memory space.
#
# In this question we’ll implement a function root that calculates the n’th root of a number. The function takes a nonnegative number x and a positive integer n, and returns the positive n’th root of x within an error of 0.001 (i.e. suppose the real root is y, then the error is: |y-root(x,n)| and must satisfy |y-root(x,n)| < 0.001).
#
# Don’t be intimidated by the question. While there are many algorithms to calculate roots that require prior knowledge in numerical analysis (some of them are mentioned here), there is also an elementary method which doesn’t require more than guessing-and-checking. Try to think more in terms of the latter.
#
# Make sure your algorithm is efficient, and analyze its time and space complexities.
#
# Examples:
#
# input:  x = 7, n = 3
# output: 1
#
# input:  x = 9, n = 2
# output: 3


def root(x,n)
  return 0 if x == 0

  curr_num = x/2
  lower_bound = 0
  upper_bound = [x,1].max

  while curr_num - lower_bound >= 0.001
    curr_square = curr_num**n
    if curr_square > x
      upper_bound = curr_num
    elsif curr_square < x
      lower_bound = curr_num
    else
      break
    end

    curr_num = (upper_bound + lower_bound)/2

  end

  curr_num
end

# How it works:

# This solution runs in a binary search, looking through the range of
# 1 to the number, and minimizing the window, until a number is found,
# or when the window shrinks to a certain number, satisfying the search
# for a root between numbers. This takes O(logn) time and O(1) space.

# puts root(9,2)
# puts root(7,3)
