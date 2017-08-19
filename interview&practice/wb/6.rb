# Write a function that takes an array and returns all of its subsets. How many sets will it return?

def subsetter(array)
  return [[]] if array.empty?

  curr_val = array[0]
  subs = subsetter(array.drop(1))
  new_subs = subs.map {|sub| sub + [curr_val]}

  subs + new_subs
end
