# Find Missing Element
#
# There is an array of non-negative integers. A second array is formed by shuffling the elements of the first array and deleting a random element. Given these two arrays, find which element is missing in the second array.

def missing_element(array1, array2)
  array1.reduce(:+) - array2.reduce(:+)
end


# puts missing_element([1,2,3,4,5],[5,2,4,3])

# This finds the number by adding up both arrays and finding the difference.
# O(1) space and O(n) time where n is the amount of integers
