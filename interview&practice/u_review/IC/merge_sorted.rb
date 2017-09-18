=begin
In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.
Each order is represented by an "order id" (an integer).

We have our lists of orders sorted numerically already, in arrays. Write a function to merge our arrays of orders into one sorted array.

For example:

  my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]

puts merge_arrays(my_array, alices_array)
# prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
=end

def merge_arrays(array1,array2)
  result = []

  until array1.empty? || array2.empty?
    if array1[0] > array2[0]
      result.push(array2.shift)
    else #array1[0] <= array2[0]
      result.push(array1.shift)
    end
  end

  result.concat(array1).concat(array2)
end
my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]

puts merge_arrays(my_array, alices_array) == [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
