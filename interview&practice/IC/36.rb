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

  true
end
