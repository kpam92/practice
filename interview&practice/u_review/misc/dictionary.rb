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

  attr_accessor :root
  def initialize
    @root = Node.new('*')
  end

  def add_word(word)

    curr_node = @root

    word.chars.each do |letter|

      child_node = curr_node.children[letter]
      if child_node.nil?
        child_node = Node.new(letter)
        curr_node.add_child(child_node)
      end

      curr_node = child_node
    end
    curr_node.add_child(Node.new('*'))
    word
  end

  def check_word(word)
    curr_node = @root
    word.chars.each do |letter|
      child_node = curr_node.children[letter]
      return false if curr_node.nil?
      curr_node = child_node
    end
    return true if curr_node.children['*']
    false
  end
end


def sequence_segmenter(string,dictionary)
  return true if string.empty?
  trie_dictionary = Trie.new
  dictionary.each { |word| trie_dictionary.add_word(word) }
  string.delete!(' ')

  result = sift_helper(string,trie_dictionary)

end

def sift_helper(string, trie)
  idx = 0
  curr_node = trie.root.children[string[idx]]

  while idx < string.length
    return false if curr_node.nil?

    if curr_node.children['*'] && idx == string.length - 1
      return true
    elsif curr_node.children['*'] && trie.root.children[string[idx + 1]]
      curr_solution = sift_helper(string[idx+1..-1],trie)
      return true if curr_solution
    end
    idx += 1
    curr_node = curr_node.children[string[idx]]
  end
  false
end
