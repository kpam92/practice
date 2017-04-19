require 'set'
require 'byebug'

def cool_number?(num)
  new_number = num
  seen_numbers = Set.new

  cool = false

  until cool
    # byebug
    new_number = new_number.to_s.chars.map {|x| x.to_i**2}.reduce(:+)
    return false if (seen_numbers.include?(new_number) )
    seen_numbers.add(new_number)
    return true if new_number == 1
  end
end

# cool_number?(23)
sum = 0
(1..1000000).each {|x| sum += x if cool_number?(x)}

# puts sum
# sum = 70601040511


# instructions for completing later

# url: http://dev.getethos.com/
# undo #instructions display:none

# current ajax request:
#
#     for (let i = 1; i < 101; i++) {
#         $.ajax({
#     		method: 'POST',
#     		url: `/code${i}`,
#     		data: {"X-COOL-SUM": '70601040512'},
#     		function(data){
#             alal.push(data)}
#         });}
