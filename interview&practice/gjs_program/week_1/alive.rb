# Given a list of peoples' birth year and death year, find the year(s) in which the most people were alive. Ex: [[1910,1969], [1950,2050], [1969, 2020]] should return [1969]

def most_lived(array)
  lowest = nil
  highest = nil

  array.each do |birth,death|
    lowest = birth if (lowest.nil? || birth < lowest)
    highest = death if (highest.nil? || birth > highest)
  end

  years = Hash.new {|h,k| h[k] = 0}

  array.each do |birth,death|
    while birth <= death
      years[birth] += 1
      birth += 1
    end
  end

  curr_highest = years.values[0]
  curr_result = []

  years.each do |year, people|
    if people > curr_highest
      curr_highest = people
      curr_result = [year]
    elsif people == curr_highest
      curr_result << year
    end
  end

  curr_result

end

# How it works:

# This solution creates a hash with all the dates from the earliest year, to
# the latest, then iterates through the ranges, and adds to the values in the hash.
# We then find the years that have the most people living, and return the array.
# This takes O(n) space and time, where n is the range from earliest year to latest.

# p most_lived([[1910,1969], [1950,2050], [1969, 2020]])
