=begin
Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

For "(()", the longest valid parentheses substring is "()", which has length = 2.

Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
=end

def longest_parens(string)
  stack = 0
  longest = 0
  curr_length = 0
  idx = 0

  while idx < string.length
    if string[idx] == '('
      stack += 1
    else # string[idx] == ')'
      if stack > 0
        stack -= 1
        curr_length += 2
      else #stack == 0
        longest = curr_length if curr_length > longest
        curr_length = 0
      end
      longest = curr_length if curr_length > longest
    end
    idx += 1
  end

  longest
end

p longest_parens(")()())")
p longest_parens("(()")
