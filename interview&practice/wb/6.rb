# Write a function that takes an array and returns all of its subsets. How many sets will it return?

def subsetter(array)
  return [[]] if array.empty?

  curr_val = array[0]
  subs = subsetter(array.drop(1))
  new_subs = subs.map {|sub| sub + [curr_val]}

  subs + new_subs
end


# Given an array and index, find if it's possible to reach the value 0 by starting at the given index and repeatedly moving left/right by the distance found at array[index].

def can_win?(array,idx)
end
