

def cool_num?(num)
  until num == 1
    num = num.to_s.chars.map {|x| (x.to_i)**2}.reduce(:+)
    if num == 4
      return false
    elsif num == 1
      return true
    end
  end
  true
end

result = 0

(1..1000000).each do |num|
  result += num if cool_num?(num)
end


# 70601040511

$.ajax({type: "POST", url: "http://166.78.22.78/dev/open-sesame.php", data: {code: "70601040511"}, success: function(data){console.log(data)}})
