# def longest_palindrome(str)
#  palindrome_lengths = {}
#  center = 0
#  right = 0
#  # This gsub changes a string "abc" into "~a~b~c~"
#  # This is done to avoid the problem of even length palindromes
#  processed_str = str.gsub(/(\w|$)/, '~\1')
#  0.upto (processed_str.length - 1) do |i|
#    i_mirror = center - (i - center)
#    if (right > i)
#      palindrome_lengths[i] = [right-i, palindrome_lengths[i_mirror]].min
#    else
#      palindrome_lengths[i] = 0
#    end
#    while (processed_str[i + 1 + palindrome_lengths[i]] == processed_str[i - 1 - palindrome_lengths[i]])
#      palindrome_lengths[i] += 1
#    end
#    if (i + palindrome_lengths[i] > right)
#      center = i;
#      right = center + palindrome_lengths[i];
#    end
#  end
#  max = palindrome_lengths.values.max
#  center_index = palindrome_lengths.key(max)
#  str[(center_index - max)/2, max]
# end
