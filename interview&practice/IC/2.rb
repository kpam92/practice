# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
# Write a function get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.
# Do not use division in your solution.



def except_curr_prod(array)

  result = [1]

  #getting all product before integer
  idx = 0

  while idx < array.length - 1
    result.push(array[idx] * result[-1])
    idx += 1
  end

  idx = array.length - 2
  curr_prod = 1
  while idx >= 0
    curr_prod = array[idx + 1] * curr_prod #4
    result[idx] *= curr_prod

    idx -= 1
  end

  result
end



# How it works:
# To find the product of every number except the element in an array,
# we split it up into integers that come before 'k' in the array, and
# integers that come after 'k' in the array. So, we first iterate through
# the array, collecting the product of the integers and adding them to a
# new array. Then, we iterate down, and collect the ones that would come
# afterwards. This takes O(n) space and time, where n is the length of the
# array. We us n space for creating a new result array, and n space for iterating
# through every element in the initial array.

# puts except_curr_prod([1, 7, 3, 4])
# puts except_curr_prod([1, 2,3,4])
