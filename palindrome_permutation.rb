# Given a string, write a function to check if it is a permutation of a palindrome

def palindrome_permutation(string)
  result = Hash.new(0)

  letters = string.gsub(" ","").chars

  letters.each do |letter|
    result[letter] += 1
  end

  one_count = 0

  result.each do |h,k|
    if k % 2 != 0
      return false if count > 0
      one_count += 1
    end
  end

  true
end
