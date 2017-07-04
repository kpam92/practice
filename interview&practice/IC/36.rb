# To prove this, let's write a function to tell us if a full deck of cards shuffled_deck is a single riffle of two other halves half1 and half2.
#
# We'll represent a stack of cards as an array of integers in the range 1..521..52 (since there are 5252 distinct cards in a deck).


def riffle?(deck, half1,half2)

  idx = 0

  while idx < deck.length
    if deck[idx] == half1[0]
      half1.shift(1)
    elsif deck[idx] == half2[0]
      half2.shift(1)
    else
      return false
    end

    idx += 1
  end

  half2.empty? && half1.empty?
end


# How it works:

# This solution depends on making sure that the next card of the shuffled deck
# is either the first card in half1 or half2. So we increment through the shuffled
# deck, and shift off the card from the respective half. We return false if it doesn't
# exist in either half, or if at the end, the halves aren't empty

# puts riffle?([1,2,3],[1,2,3],[])
# puts riffle?([1,2,3],[1,3],[2])
# puts riffle?([1,2,3,4],[1,3],[2])
