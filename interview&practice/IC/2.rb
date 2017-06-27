# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
# Write a function get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.
# Do not use division in your solution.



def except_curr_prod(array)

  result = [1]

  #getting all product before integer
  idx = 0

  while idx < array.length - 1
    result.push(array[idx] * result[-1])
  end

  idx = array.length - 1
  curr_prod = 1
  while idx >= 0

    curr_prod = array[idx] * curr_prod
    result[idx] *= curr_prod
    idx -= 1
  end
  
  result
end
