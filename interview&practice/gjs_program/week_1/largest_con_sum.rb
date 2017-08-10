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


puts largest_con_sum([1,2,-100,400,1])
# puts largest_con_sum([])
# puts largest_con_sum([])
