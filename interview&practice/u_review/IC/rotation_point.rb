=begin
Write a function for finding the index of the "rotation point," which is where I started working from the beginning of the dictionary. This array is huge (there are lots of words I don't know) so we want to be efficient here.
=end

words = [
  'ptolemaic',
  'retrograde',
  'supplant',
  'undulate',
  'xenoepist',
  'asymptote', # <-- rotates here!
  'babka',
  'banoffee',
  'engender',
  'karpatka',
  'othellolagkage',
]


def rotation_point(array)
  head = 0
  tail = array.length - 1

  while head <= tail
    middle = (head + tail)/2
    return head if middle == 0
    if array[middle - 1][0] > array[middle]
      return middle
    elsif array[middle][0] > array[0][0]
      head = middle + 1
    else
      tail = middle - 1
    end
  end
0
end

# puts rotation_point(words)
# puts rotation_point(%w(d e f g a b c d))
