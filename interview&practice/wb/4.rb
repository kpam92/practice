# Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition: the first two digits summed with the last two digits are equal to the middle two digits. E.g.,
#
# 1978 => 19 + 78 = 97
# 2307 => 23 + 07 = 30

def silly_years(number)
  result = []
  number += 1
  until result.length == 10
    result << number if silly?(number)
    number += 1
  end
  result
end

def silly?(number)
  number = number.to_s
  number[0..1].to_i + number[2..3].to_i == number[1..2].to_i
end
