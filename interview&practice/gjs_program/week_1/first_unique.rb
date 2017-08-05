# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
#
# Examples:
#
# s = "leetcode"
# return 0.
#
# s = "loveleetcode",
# return 2.
# Note: You may assume the string contain only lowercase letters.

def first_uniq(string)
  seen = Hash.new

  string.chars.each.with_index do |letter,idx|
    if seen[letter]
      seen[letter] = false
    else
      seen[letter] = idx
    end
  end

  seen.each {|h,k| return k unless k == false }
  -1
end

# How it works:
# this solution looks through every letter, then adds that instance's index to the hash.
# If the letter already exists in the hash, then it is set to false. It then returns the first
# true index, or -1. This solution takes O(n) space and time, where n is the length of the string

# puts first_uniq('leetcode')
# puts first_uniq('loveleetcode')
# puts first_uniq('lleettccooddee')
