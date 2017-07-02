# You created a game that is more popular than Angry Birds.
# Each round, players receive a score between 0 and 100, which you use to rank them from highest to lowest. So far you're using an algorithm that sorts in O(n\lg{n})O(nlgn) time, but players are complaining that their rankings aren't updated fast enough. You need a faster sorting algorithm.
#
# Write a function that takes:
#
# an array of unsorted_scores
# the highest_possible_score in the game
# and returns a sorted array of scores in less than O(n\lg{n})O(nlgn) time.
#
# For example:
#
#   unsorted_scores = [37, 89, 41, 65, 91, 53]
# HIGHEST_POSSIBLE_SCORE = 100
#
# sort_scores(unsorted_scores, HIGHEST_POSSIBLE_SCORE)
# # returns [91, 89, 65, 53, 41, 37]
#
# We’re defining nn as the number of unsorted_scores because we’re expecting the number of players to keep climbing.
#
# And we'll treat highest_possible_score as a constant instead of factoring it into our big O time and space costs, because the highest possible score isn’t going to change. Even if we do redesign the game a little, the scores will stay around the same order of magnitude.

def sort_score(array)
  scores = {}
  (1..100).each {|x| scores[x] = 0}

  array.each {|x| scores[x] += 1}

  result = []

  scores.each {|x,y| y.times {result.push(x)}}

  result
end

# How it works:
# This creates an entire range from the scores of 0 to 100, then calcuates
# the occurences of each score, then pushes each score into a sorted array.
# This take O(n) space and time where n is the highest score.
