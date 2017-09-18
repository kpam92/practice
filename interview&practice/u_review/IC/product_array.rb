=begin
You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
Write a function get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.
=end


def prod_of_others(array)
  result = [1]

  curr_multiplier = 1
  idx = 0

  while idx < array.length - 1
    curr_multiplier *= array[idx]
    result.push(curr_multiplier)
    idx += 1
  end

  result

end

puts prod_of_others([1, 7, 3, 4])
