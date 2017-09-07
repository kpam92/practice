# Given a string 's', and a dictionary of words, determine
# if s can be segmented into a sequence of one or more words

class Node

  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @children = {}
  end

  def add_child(node)
    @children[node.value] = node
  end

end

class Trie

  def initialize
    @root = "*"
    @children = {}
  end

  def add_word(word)
    curr_children = @children
    word.chars.each do |letter|
      curr_node = curr_children[letter] ? curr_children[letter] : Node.new(letter)
      curr_children = curr_node.children
    end
    # signifies end of word
    curr_children['*'] = nil
    word
  end

  def word_check(word)

end
