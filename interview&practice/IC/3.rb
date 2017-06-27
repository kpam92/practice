# Given an array of integers, find the highest product you can get from three of the integers.
# The input array_of_ints will always have at least three integers.

# things to look out for
 # - highest product can include two negative integers

 def highest_three_prod(array)
   return nil if array.length < 3

   if array[1] >= array[0]
     highest_one = array[1]
     lowest_one = array[0]
   else
     highest_one = array[0]
     lowest_one = array[1]
   end

   highest_two = highest_one * lowest_one
   lowest_two = highest_one * lowest_one

   highest_three = highest_two * array[2]

   idx = 2

   while idx < array.length
     #check for highest three product
     curr_three = array[idx] * highest_two
     highest_three = curr_three if curr_three > highest_three

     #check for highest_two product
     curr_two = array[idx] * highest_one
     highest_two = curr_two if curr_two > highest_two

     #check for highest one
     highest_one = array[idx] if array[idx] > highest_one

     #check for lowest two
     curr_two = array[idx] * lowest_one
     lowest_two = curr_two if curr_two > lowest_two

     #check for lowest one
     lowest_one = array[idx] if array[idx] < lowest_one

     idx += 1
   end

   negative_prod = lowest_two * highest_one

   highest_three > negative_prod ?  highest_prod :  negative_prod

 end

 puts highest_three_prod([-10,-10,1,3,2,20,20])
