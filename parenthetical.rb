# "Sometimes (when I nest them (my parentheticals)
#  too much (like this (and this))) they get confusing."
#
# Write a function that, given a sentence like the one above,
#  along with the position of an opening parenthesis,
#   finds the corresponding closing parenthesis.

def par(string, position)
opening = []
closing = []

  string.chars.each_with_index do |el,idx|

    if el == "("
      opening << idx
    elsif el == ")"
      closing << idx
    end

  end

closing[opening.length - (1 + opening.index(position))]

end



def par(string, position)
  open_count = 0

  string.chars.each_with_index do |el,idx|

    if el == "("
      open_count += 1
      target_count = open_count if idx == position
    elsif el == ")"
      open_count -= 1
      return idx if open_count == target_count
    end

  end

closing[opening.length - (1 + opening.index(position))]

end
