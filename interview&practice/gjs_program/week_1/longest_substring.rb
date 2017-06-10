# Given a string, find the length of the longest substring without repeating characters.
#
# Examples:
#
# Given "abcabcbb", the answer is "abc", which the length is 3.
#
# Given "bbbbb", the answer is "b", with the length of 1.
#
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

require 'byebug'
def length_of_longest_substring(s)

    seen = Hash.new()

    idx = 0

    result = ['',0]

    curr_string = ''

    while idx < s.length
        # byebug
        if seen[s[idx]].nil?
          curr_string += s[idx]
          seen[s[idx]] = true
        else
          seen = Hash.new()
          seen[s[idx]] = true
          curr_string = s[idx]
        end

        if curr_string.length > result[1]
          result = [curr_string, curr_string.length]
        end

        idx += 1
    end
    result[0]
end


def length_of_longest_substring(s)

    return 0 if s.length == 0
  seen = Hash.new()

  longest = 1

  i = 0
  j = 1
  length = 1
  seen[s[0]] = 0
  while j < s.length && i < s.length
    if seen[s[j]] && (s[j] == s[j - 1])
      i = j
      seen = Hash.new()
      seen[s[i]] = i
    elsif seen[s[j]]
      i = seen[s[j]] + 1 if seen[s[j]] >= i
      seen[s[j]] = j
    else
      seen[s[j]] = j
    end
    j += 1
    longest = [longest, (j - i)].max
  end
  longest
end

puts length_of_longest_substring('bbbbb')
puts length_of_longest_substring('abcabcbb')
puts length_of_longest_substring('pwwkew')
puts length_of_longest_substring('dvdf')
puts length_of_longest_substring('wobgrovw')
