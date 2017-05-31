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

# HOW IT WORKS:
# this solution goes through each cake, and finds the ratio between
# cake to money. After sorting this, we then subtract as many of each element,
# starting with the item with the lowest ratio. Sort method in ruby uses O(nlogn) time.

# The book uses a different approach that uses the bottom-up dynamic programming approach


def max_duffel_bag_value(cake_arrays, weight_capacity)

  # we make an array to hold the maximum possible value at every
  # duffel bag weight capacity from 0 to weight_capacity
  # starting each index with value 0
  max_values_at_capacities = [0] * (weight_capacity + 1)

  (0..weight_capacity).each do |current_capacity|

      # set a variable to hold the max monetary value so far for current_capacity
      current_max_value = 0

      cake_arrays.each do |cake_weight, cake_value|

          # if a cake weighs 0 and has a positive value the value of our duffel bag is infinite!
          if (cake_weight == 0 && cake_value != 0)
              return Float::INFINITY
          end

          # if the current cake weighs as much or less than the current weight capacity
          # it's possible taking the cake would give get a better value
          if (cake_weight <= current_capacity)

              # so we check: should we use the cake or not?
              # if we use the cake, the most kilograms we can include in addition to the cake
              # we're adding is the current capacity minus the cake's weight. we find the max
              # value at that integer capacity in our array max_values_at_capacities
              max_value_using_cake = cake_value + max_values_at_capacities[current_capacity - cake_weight]

              # now we see if it's worth taking the cake. how does the
              # value with the cake compare to the current_max_value?
              current_max_value = [max_value_using_cake, current_max_value].max
          end
      end

      # add each capacity's max value to our array so we can use them
      # when calculating all the remaining capacities
      max_values_at_capacities[current_capacity] = current_max_value
  end

  return max_values_at_capacities[weight_capacity]
end
