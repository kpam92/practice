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

def bribe(array)
    line = []
    array.each {|num| line << [num,0]} #this creates a dup array with a num for tracking bribes

end
