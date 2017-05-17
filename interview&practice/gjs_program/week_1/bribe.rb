# It's New Year's Day and everyone's in line for the Wonderland rollercoaster ride!
#
# There are  people queued up, and each person wears a sticker indicating their initial position in the queue (i.e.:  with the first number denoting the frontmost position).
#
# Any person in the queue can bribe the person directly in front of them to swap positions. If two people swap positions, they still wear the same sticker denoting their original place in line. One person can bribe at most two other persons.
#
# That is to say, if  and  bribes , the queue will look like this: .
#
# Fascinated by this chaotic queue, you decide you must know the minimum number of bribes that took place to get the queue into its current state!
#
# Note: Each  wears sticker , meaning they were initially the  person in queue.
require 'byebug'
def bribe(array)

    line = []
    array.each {|num| line << [num,0]} #this creates a dup array with a num for tracking bribes
    switches = 0

    idx = 0
    while idx < line.length
      curr_person = line[idx]

      if curr_person[0] != (idx + 1)
        curr_person[1] += 1
        switches += 1
        return 'too chaotic' if curr_person[1] > 2
        line[idx], line[curr_person[0] - 1] = line[curr_person[0] - 1], line[idx]
      else
        idx += 1
      end
    end

    switches
end


def bribe(array)
    result = 0
    idx1 = array.length - 1
    while idx1 >= 0
      # byebug
      if ((array[idx1] - (idx1 + 1).abs) > 2)
          return"Too chaotic"
      end

      if idx1 > 1
        idx2 = array[idx1] - 2
      else
        idx2 = 0
      end

      while idx2 < idx1
        result += 1 if (array[idx2] > array[idx1])
        idx2 -= 1
      end
      idx1 -= 1
    end
  result
end


puts bribe([1,2,4,3])
