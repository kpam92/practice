# Implement an algorithm to check if a string has all unique characters


def is_unique?(string)
  seen = Hash.new

  string.chars.each do |letter|
    return false if seen[letter] == true
    seen[letter] = true
  end
  true
end
