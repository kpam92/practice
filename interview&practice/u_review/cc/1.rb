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
