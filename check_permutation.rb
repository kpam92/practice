# Given two strings, write a method to decide if one is a permutation of the other

def check_permutation?(string1,string2)

  return true if string1 == string2
  return false if string1.length != string2.length
  result = Hash.new(0)

  string1.chars.each do |letter|
    result[letter] += 1
  end

  string2.chars.each do |letter|
    result[letter] -= 1
  end

  result.each {|h,k| return false if k != 0}

  true
end
