# Write a recursive function for generating all permutations of an input string. Return them as a set.
# Don't worry about time or space complexity—if we wanted efficiency we'd write an iterative version.
#
# To start, assume every character in the input string is unique.
#
# Your function can have loops—it just needs to also be recursive.


def permutations(string)
  characters = Hash.new
  string.chars.each { |x| characters[x] = true }
  permutate(characters)
end

def permutate(set)
  result = []
  return [""] if set.empty?

  set.each do |letter,value|
    curr_set = set.dup
    curr_set.delete(letter)
    curr_result = permutate(curr_set)
    curr_result.map! {|x| x = letter + x }

    result.concat(curr_result)
  end

  result
end

# How it works:
# This solution works recursively, finding all permutations of a word,
# by building up each letter, and utilizing a recursive call with all the
# different combination with the remaining set in different combinations.
# This takes O(n^2) space and time through the recursive call and the amount
# of different permutations.

# puts permutations('ca')
