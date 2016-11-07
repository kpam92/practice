# Implement a basic string compression using the counts of repeated characters

def string_compression(string)
  result = []
  count = 0
  current_letter = string[0]

  string.chars.each_with_index do |letter,idx|
    count += 1 if letter == current_letter
    if letter != current_letter
      result.push("#{count}#{letter}")
      count = 1
      current_letter = letter
    else
      count += 1
    end

    if idx == (string.length - 1)
      result.push("#{count}#{letter}")
    end

  end

  result.join
end
