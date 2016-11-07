# Implement an algorithm to check if a string has all unique characters
# Also try to implement without another data structure

def is_unique_one?(string)
  
end

def is_unique_two?(string)
  seen = Hash.new

  string.chars.each do |letter|
    return false if seen[letter] == true
    seen[letter] = true
  end
  true
end
