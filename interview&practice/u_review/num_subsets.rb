# Given an array of numbers, return all subsets of the numbers

def subsets(array)
  return [[]] if array.empty?
  result = []
  curr_num = array.shift

  remaining_sets = subsets(array)

  remaining_sets.each do |set|
    result.push(set.unshift(curr_num))
  end

  result
end

puts subsets([1,2,3])
