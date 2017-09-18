=begin
I figured out how to get rich: online poker.
I suspect the online poker game I'm playing shuffles cards by doing a single riffle. ↴

To prove this, let's write a function to tell us if a full deck of cards shuffled_deck is a single riffle of two other halves half1 and half2.

We'll represent a stack of cards as an array of integers in the range 1..521..52 (since there are 5252 distinct cards in a deck).
=end


def single_riffle?(main,deck1,deck2)

  idx = 0

  while idx < main.length
    return false if main[idx] != deck1[0] && main[idx] != deck2[0]

    if main[idx] == deck1[0]
      deck1.shift
    elsif main[idx] == deck2[0]
      deck2.shift
    else
      return false
    end
    idx += 1
  end
  true
end


main = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
deck1 = [1,2,4,6,8,10,13,14,15]
deck1 = [3,5,7,9,11,16]

p single_riffle?(main,deck1,deck2)
