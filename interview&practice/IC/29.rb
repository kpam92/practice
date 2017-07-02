# You're working with an intern that keeps coming to you with JavaScript code that won't run because the braces, brackets, and parentheses are off. To save you both some time, you decide to write a braces/brackets/parentheses validator.
# Let's say:
#
# '(', '{', '[' are called "openers."
# ')', '}', ']' are called "closers."
# Write an efficient function that tells us whether or not an input string's openers and closers are properly nested.
#
# Examples:
#
# "{ [ ] ( ) }" should return true
# "{ [ ( ] ) }" should return false
# "{ [ }" should return false


def bracket_validator(string)
  brackets = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  stack = []

  idx = 0

  while idx < string.length
    if string[idx] == "(" || string[idx] == "[" || string[idx] == "{"
      stack.push(string[idx])
    elsif string[idx] == ")" || string[idx] == "]" || string[idx] == "}"
      return false unless brackets[stack[-1]] == string[idx]
      stack.pop
    end
    idx += 1
  end

  stack.empty?

end

# How it works
# This solution uses a stack, making sure that the opening and closing brackets
# are the in the correct order. This takes O(n) space and time, where n is the
# length of the string.



# puts bracket_validator("{ [ ] ( ) }" )
# puts bracket_validator(" " )
# puts bracket_validator("{ [ ( ] ) }")
# puts bracket_validator("{ [ }")
