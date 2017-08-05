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


puts first_uniq('leetcode')
puts first_uniq('loveleetcode')
