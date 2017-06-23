# You've built an inflight entertainment system with on-demand movie streaming.
# Users on longer flights like to start a second movie right when their first one ends, but they complain that the plane usually lands before they can see the ending. So you're building a feature for choosing two movies whose total runtimes will equal the exact flight length.
#
# Write a function that takes an integer flight_length (in minutes) and an array of integers movie_lengths (in minutes) and returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length.
#
# When building your function:
#
# Assume your users will watch exactly two movies
# Don't make your users watch the same movie twice
# Optimize for runtime over memory


def in_flight(flight_length, movie_lengths)
  movies = Hash.new {|h,k| h[k] = 0 }

  movie_lengths.each {|x| movies[x] += 1}

  movie_lengths.each do |movie|
    curr_length = flight_length - movie

    if curr_length == movie
      return true if movies[curr_length] > 1
    else
      return true if movies[curr_length] > 0
    end
  end

  false
end

# how it works

# We first fill a hash with all the occurences of movie times,
# then we iterate through the movie lengths again, subtracting them from
# the flight_length, and looking for the partner. This is O(n) space and time,
# where n is the length of the movies.
