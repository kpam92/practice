# Write a function, longest_common_substring(str1, str2) that takes two strings and returns the longest common substring. A substring is defined as any consecutive slice of letters from another string.

def longest_common_substring(string1, string2)
end


# Write a function that takes an array of integers and returns their sum. Use recursion.

def array_sum(array)
  curr_num = array.pop
  return curr_num if array.empty?

  curr_num + array_sum(array)
end
