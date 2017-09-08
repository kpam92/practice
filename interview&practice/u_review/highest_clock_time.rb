# Given 4 non-negative integers a,b,c,d. All of them are less than or equal to 9. I have to return the maximum time that can be shown on the clock in 24-hour format.
#
# For example: a=9, b=4, c=3, d=1, would yield 19:43

# input: [9,4,3,1]
# output: 19:43

def highest_clock_time(array)
  clock_checker(array.sort)
end

def clock_checker(array)
end
