def is_perm?(string1,string2)
  seen = Hash.new {|h,k| h[k] = 0 }
  string1.chars.each {|x| seen[x] += 1}

  string2.chars.each do |x|
    return false unless seen[x] > 0
    seen[x] -= 1
  end
  return false if seen.values.reduce(:+) > 0
  true
end

# puts is_perm('kevin','nivek')

def pal_perm?(string)
  seen = Hash.new {|h,k| h[k] = 0}

  string.chars.each do |x|
    low_letter = x.downcase
    if low_letter.ord > 96 && low_letter.ord < 123
      seen[x.downcase] += 1
    end
  end

  odd = false

  seen.each do |key,value|
    if value % 2 == 1
      return false if odd
      odd = true
    end
  end

  true
end

# puts pal_perm?('Tact Coa')

def one_edit_away(string1,string2,edits = 0)
  return true if string1 = string2
  return true if string1.empty? && string2.length == 1 && edits == 0
  return true if string2.empty? && string1.length == 1 && edits == 0
  return false if string1.empty? || string2.empty?

  idx1 = 0
  idx2 = 0
  while idx1 < string1.length && idx2 < string2.length
    if string1[idx1] == string2[idx2]
      idx1 += 1
      idx2 += 1
    elsif string1[idx1] != string2[idx2]
      return false if edits == 1
      option1 = one_edit_away(string1[idx..-1],string2[idx+1..-1],1)
      option2 = one_edit_away(string1[idx+1..-1],string2[idx..-1],1)
      return option1 || option2
    end
  end
end

puts one_edit_away('pale','pale')
puts one_edit_away('pale','bale')
puts one_edit_away('pale','pales')
puts one_edit_away('pale','ple')
puts one_edit_away('pale','bake')
