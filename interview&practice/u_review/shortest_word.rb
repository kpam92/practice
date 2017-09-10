# Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.
#
# For example, Assume that words = ["practice", "makes", "perfect", "coding", "makes"].
#
# Given word1 = "coding", word2 = "practice", return 3. Given word1 = "makes", word2 = "coding", return 1.

def shortest_word_distance(words,word1,word2)
  seen_hash = Hash.new { |h,k| h[k] = [] }
  words.each_with_index {|x,idx| seen_hash[x] << idx if (x == word1 || x == word2) }

  result = nil

  seen_hash[word1].each do |x|
    seen_hash[word2].each do |y|
      curr_result = (x - y).abs
      result = curr_result if result.nil? || result > curr_result
    end
  end
  result
end

words = ["practice", "makes", "perfect", "coding", "makes"]
puts shortest_word_distance(words,'coding','practice')
puts shortest_word_distance(words,'makes','practice')
