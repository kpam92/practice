=begin
any permutation ↴ of an input string is a palindrome. ↴
You can assume the input string only contains lowercase letters.

Examples:

"civic" should return true
"ivicc" should return true
"civil" should return false
"livci" should return false
=end
require 'set'

def perm_checker(string)
  seen = Set.new

  idx = 0
  while idx < string.length
    if seen.include?(string[idx])
      seen.delete(string[idx])
    else
      seen.add(string[idx])
    end

    idx += 1
  end

  seen.length <= 1
end

puts perm_checker('civic') == true
puts perm_checker('ivicc') == true
puts perm_checker('civil') == false
puts perm_checker('livci') == false
