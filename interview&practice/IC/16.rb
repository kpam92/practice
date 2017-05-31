# As a thief, you bring in a duffel bag that can carry only X weight.
# Input is an array of cakes, where the first value is the weight of a
# a single cake, and the second is it's worth for one cake. Create a
# function that returns the maximum monetary value the duffel can hold.


def cake_thief(cakes, duffel_max)

  #pushes a ratio value of value to cake
  cakes.each do |cake|
      if cake[0] == 0 && cake[1] > 0
        return 'INFINITY CAKES'
      elsif cake[0] == 0
        cake.unshift(0)
      else
        cake.unshift(cake[0].to_f/cake[1].to_f)
      end
  end
  print cakes
  cakes.sort! {|x,y| x[0] <=> y[0]}

  result = 0

  while cakes.length > 0
    current_cake = cakes[0]
    current_max = duffel_max/current_cake[1]
    result += current_max * current_cake[2]
    duffel_max -= current_max * current_cake[1]
    cakes.shift
  end
  result
end
