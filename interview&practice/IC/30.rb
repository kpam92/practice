# Write an efficient function that checks whether any permutation ↴ of an input string is a palindrome ↴ .
# You can assume the input string only contains lowercase letters.
#
# Examples:
#
# "civic" should return true
# "ivicc" should return true
# "civil" should return false
# "livci" should return false

def valid_pal_perm(string)

  seen = Hash.new {|h,k| h[k] = 0}

  idx = 0
  while idx < string.length

    seen[string[idx]] += 1
    idx += 1
  end

  odd = false

  seen.each do |key,value|

    if value % 2 == 1
      return false if odd
      odd = true
    end

  end

  true
end

# How it works:

# This iterates through the string, collecting each instance, then we iterate
# through the hash, and return true if is one or no odd instances. This takes O(n)
# space and time, where n is the length of the string.

 # puts valid_pal_perm("civic") # should return true
 # puts valid_pal_perm("ivicc") # should return true
 # puts valid_pal_perm("civil") # should return false
 # puts valid_pal_perm("livci") # should return false
