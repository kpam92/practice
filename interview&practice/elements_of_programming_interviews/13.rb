# Write a function that determines if a paragraph of text can
# be created using another paragraph, using a hash map of
# some sort

def letter_possible?(text, source_text)
  letters = Hash.new {|h| h = 0}

  text = text.gsub(' ','')

  text.chars.each do |letter|
    letters[letter] += 1
  end

  source_text = source_text.gsub(' ','')

  source_text.chars.each do |letter|
    letters[letter] -= 1 if (letters[letter] > 0)
    return true if letters.values.reduce(:+) == 0
  end
  true if letters.values.reduce(:+) == 0
  false
end

# how it works:
# This greedy solution iterates through the potential text,
# storing the number of occurences of each letter, then iterates
# through the source text, subtracting from the hash. If the hash
# has 0 occurences, it returns true early. If it iterates through
# the text and there are still occurences, it returns false. Because
# it goes through two iterations in a greedy manner, its complexity
# is O(nm), n and m being the two texts.
