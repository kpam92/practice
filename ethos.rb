require 'set'
require 'byebug'

def cool_number?(num)
  new_number = num
  seen_numbers = Set.new

  cool = false

  until cool
    # byebug
    new_number = new_number.to_s.chars.map {|x| x.to_i**2}.reduce(:+)
    return false if (seen_numbers.include?(new_number) || new_number == 4)
    seen_numbers.add(new_number)
    return true if new_number == 1
  end
end

# cool_number?(23)
sum = 0
(1..1000000).each {|x| sum += x if cool_number?(x)}

# puts sum
# sum = 70601040511
