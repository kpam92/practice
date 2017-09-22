require 'byebug'

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

# def one_edit_away(string1,string2,edits = 0)
#   # puts "#{string1} #{string2}"
#   return true if string1 == string2
#   return true if string1.empty? && string2.length == 1 && edits == 0
#   return true if string2.empty? && string1.length == 1 && edits == 0
#   return false if string1.empty? || string2.empty?
#
#   idx1 = 0
#   idx2 = 0
#   while idx1 < string1.length && idx2 < string2.length
#     if string1[idx1] == string2[idx2]
#       idx1 += 1
#       idx2 += 1
#     elsif string1[idx1] != string2[idx2]
#       return false if edits == 1
#       option1 = one_edit_away(string1[idx1..-1],string2[idx2+1..-1],1)
#       option2 = one_edit_away(string1[idx1+1..-1],string2[idx2..-1],1)
#       option3 = one_edit_away(string1[idx1+1..-1],string2[idx2+1..-1],1)
#       return option1 || option2 || option3
#     end
#   end
#
#   (string1.length - string2.length).abs > 1 ? false : true
# end

def one_edit_away(string1,string2)
  return true if string1 == string2

  if string1.length == string2.length
    change = false
    idx = 0
    while idx < string1.length
      if string1[idx] != string2[idx]
        return false if change
        change = true
      end
      idx += 1
    end
    return true
  else # string1.length != string2.length
    idx = 0

    while idx < string1.length && idx < string2.length
      if string1[idx] != string2[idx]
        option1 = string1[idx..-1] == string2[idx+1..-1]
        option2 = string1[idx+1..-1] == string2[idx..-1]
        return option1 || option2
      end
      idx += 1
    end
    string1.length - string2.length > 1 ? false : true
  end

end
#
# puts one_edit_away('pale','pale')
# puts one_edit_away('pale','bale')
# puts one_edit_away('ale','bale')
# puts one_edit_away('pale','pales')
# puts one_edit_away('pale','ple')
# puts one_edit_away('pale','bake')
# puts one_edit_away('pale','ke')

def string_compression(string)
  result = ''

  curr_letter = string[0]
  curr_count = 0

  idx = 0

  while idx < string.length
    if string[idx] == curr_letter
      curr_count += 1
    else # string[idx] != curr_letter
      result += "#{curr_letter}#{curr_count}"
      curr_letter = string[idx]
      curr_count = 1
      return string if result.length >= string.length && idx < string.length - 1
    end

    if idx == string.length - 1
      result += "#{curr_letter}#{curr_count}"
      return string if result.length >= string.length
    end

    idx += 1
  end

  result
end

# puts string_compression('aabcccccaaa')
# puts string_compression('abcdefg')

def zero_matrix(matrix)
  row = 0
  rows = {}
  columns = {}
  while row < matrix.length
    column = 0
    while column < matrix[row].length
      if matrix[row][column] == 0
        rows[row] = true
        columns[column] = true
      end
      column += 1
    end
    row += 1
  end
  zero_row(matrix,rows.keys)
  zero_col(matrix,columns.keys)
  matrix
end
def zero_row(matrix,rows)
  rows.each do |row|
    col = 0
    while col < matrix[row].length
      matrix[row][col] = 0
      col += 1
    end
  end
end

def zero_col(matrix,columns)
  columns.each do |col|
    row = 0
    while row < matrix.length
      matrix[row][col] = 0
      row += 1
    end
  end
end

# matrix = [
#   [1,1,1,1,1,1],
#   [1,0,1,1,1,1],
#   [1,1,1,1,1,1],
#   [1,1,1,1,0,1]
# ]
#
# p zero_matrix(matrix)

def is_substring?(string1,string2)
  return false if string1.length != string2
  return true if string1 == string2
  string1 += string1
  string1.include?(string2)
end
