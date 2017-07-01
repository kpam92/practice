# I like parentheticals (a lot).
# "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
#
# Write a function that, given a sentence like the one above, along with the position of an opening parenthesis, finds the corresponding closing parenthesis.
#
# Example: if the example string above is input with the number 10 (position of the first parenthesis), the output should be 79 (position of the last parenthesis).

def par_partner(string,index)
  queue = []

  idx = index + 1

  while idx < string.length

    if string[idx] == "("
      queue.push("(")
    elsif string[idx] == ")" && queue.empty?
      return idx
    elsif string[idx] == ")"
      queue.pop(1)
    end

    idx += 1
  end

  'no partner'
end
