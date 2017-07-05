# In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.
# Each order is represented by an "order id" (an integer).
#
# We have our lists of orders sorted numerically already, in arrays. Write a function to merge our arrays of orders into one sorted array.


def merge_arrays(array1,array2)
  result = []
  until array1.empty? || array2.empty?
    if array1[0] < array2[0]
      result.push(array1.shift(1))
    else
      result.push(array2.shift(1))
    end
  end

  result.concat(array1).concat(array2)
end

# How it works:

# This solution compares the first element of each array,and pushes the smaller
# element. After one array is empty, we then concat the remainder on to the
# result array. This takes O(n) space and time, where n is the length of the array.

# my_array     = [3, 4, 6, 10, 11, 15]
# alices_array = [1, 5, 8, 12, 14, 19]
#
# puts merge_arrays(my_array, alices_array)
