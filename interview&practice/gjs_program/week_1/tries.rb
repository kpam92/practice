# Given a text file and a word, find the positions that the word
# occurs in the file. We'll be asked to find the positions of many
#  words in the same file.
#
# Example:
# example.txt:
# hi
# hello
# hey
# hi
#
# solution_function(example.txt, "hi") => [0, 3]


class Node

  attr_accessor :positions

  def initialize(letter)
    @letter = letter
    @end = false
    @positions = []
    @children = {}
  end
end

class Trie
  def initialize
    @root = Node.new('')
  end
end
