=begin
Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

For "(()", the longest valid parentheses substring is "()", which has length = 2.

Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
=end

def longest_valid_parentheses(string)
  stack = []
  longest = 0
  curr_length = 0
  idx = 0

  while idx < string.length
    if string[idx] == '('
      stack.push([idx,'('])
    else # string[idx][1] == ')'
      if stack.length > 0 && stack[-1][1] == '('
        stack.pop
      else #stack == 0 || stack[-1][1] == ')'
        stack.push([idx,')'])
      end
    end

  end
    return string.length if stack.empty?

    longest = 0
    bottom = nil
    idx = 0

    while idx < stack.length
        curr_diff = bottom.nil? ? stack[idx][0] : (stack[idx][0] - bottom - 1)

        longest = curr_diff if curr_diff > longest
        bottom = stack[idx][0]
        idx += 1
    end

    longest = (string.length - stack[-1][0] - 1) if (string.length - stack[-1][0] - 1) > longest

  longest
end

p longest_valid_parentheses(")()())")
p longest_valid_parentheses("(()")
