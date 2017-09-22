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
