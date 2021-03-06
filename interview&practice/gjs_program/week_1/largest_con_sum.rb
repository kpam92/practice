 # Given an array of integers (positive and negative) find the largest continuous sum.

 def largest_con_sum(array)

   largest_sum = array[0]
   curr_max = largest_sum

   idx = 0

   while idx < array.length
     curr_max = [curr_max + array[idx], array[idx]].max
     largest_sum = [curr_max, largest_sum].max
     idx += 1
   end

   largest_sum
 end


# How it works:
#
# This greedy solution keeps track of the current largest sum, as well as the
# current sum, making sure that if the number ever become negative, we reset the
# beginning number of the sum. At each number, we compare the current sum and the
# largest current sum. This takes O(1) space, and O(n) time, where n is the length
# of the array.
#
# puts largest_con_sum([1,2,-100,400,1])
# puts largest_con_sum([1,2,-100,400,1,-10,11])
# puts largest_con_sum([])
# puts largest_con_sum([])
