# I like parentheticals (a lot).
text = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
#
# Write a function that, given a sentence like the one above, along with the position of an opening parenthesis, finds the corresponding closing parenthesis.
#
# Example: if the example string above is input with the number 10 (position of the first parenthesis), the output should be 79 (position of the last parenthesis).

def par_partner(string,index)
  return "index isn't a parenthesis" unless string[index] == '('

  stack = []

  idx = index + 1

  while idx < string.length

    if string[idx] == "("
      stack.push("(")
    elsif string[idx] == ")" && stack.empty?
      return idx
    elsif string[idx] == ")"
      stack.pop(1)
    end

    idx += 1
  end

  'no partner'
end


# How it works:
# 
# This function uses a stack, where we add to the stack when we encounter
# and open parenthesis, and we pop off the stack when we encounter a closed one,
# if there is anything to pop. If the stack is empty when we encounter a closed one,
# this signifies the match to our initial parenthesis. This takes O(1) space, and
# O(n) time, where n is the length of the string.

# puts par_partner(text, 10)
