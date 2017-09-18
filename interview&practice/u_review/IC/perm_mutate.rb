=begin
any permutation ↴ of an input string is a palindrome. ↴
You can assume the input string only contains lowercase letters.

Examples:

"civic" should return true
"ivicc" should return true
"civil" should return false
"livci" should return false
=end

def perm_checker(string)
  seen = Hash.new {|h,k| h[k] = 0}

  idx = 0
  while idx < string.length
    seen[string[idx]] += 1
    idx += 1
  end

  odd = false

  seen.each do |key,value|
    if value % 2 == 1
      return false if odd == true
      odd = true
    end
  end
  true
end
