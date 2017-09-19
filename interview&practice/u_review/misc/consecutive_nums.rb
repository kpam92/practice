=begin
Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

For example,

Given [100, 4, 200, 1, 3, 2],
The longest consecutive elements sequence is [1, 2, 3, 4].
Return its length: 4.

Your algorithm should run in O(n) complexity.


=end
require 'set'

def consecutive(arr)
  seen = Set.new

  arr.each {|x| seen.add(x)}

  longest = []

  seen.each do |x|
    next if seen.include?(x - 1)
    curr_sequence = []
    curr_num = x
    while seen.include?(curr_num)
      curr_sequence << curr_num
      curr_num += 1
    end

    longest = curr_sequence if curr_sequence.length > longest.length
  end
  longest
end

p consecutive([100, 4, 200, 1, 3, 2])
p consecutive([ 1, 11, 102, 12, 32, 13, 80, 10 ])
