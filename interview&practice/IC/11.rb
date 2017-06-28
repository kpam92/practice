# I'm making a search engine called MillionGazillion™.
# I wrote a crawler that visits web pages, stores a few keywords in a database, and follows links to other web pages. I noticed that my crawler was wasting a lot of time visiting the same pages over and over, so I made a set, visited, where I'm storing URLs I've already visited. Now the crawler only visits a URL if it hasn't already been visited.
#
# Thing is, the crawler is running on my old desktop computer in my parents' basement (where I totally don't live anymore), and it keeps running out of memory because visited is getting so huge.
#
# How can I trim down the amount of space taken up by visited?


# Thought: to clear up space, create a TRIE, where we store each variable that
# may lead up to a visited link


class Trie

  def initialize
    @head = Node.new("*",nil)
  end

  def insert_link(link)
    idx = 0
    curr_node = this.head
    while idx < link.length
      if !curr_node.contain?(link[idx])
        curr_node.insert(link[idx])
      end
      curr_node = curr_node.children[link[idx]]
      if idx == link.length - 1
        curr_node.insert_end
      end
      idx += 1
    end
  end

  def visited?(link)
    idx = 0
    curr_node = this.head

    while idx < link.length

      return false unless curr_node.contain(link[idx])
      curr_node = curr_node.children[link[idx]]

      if idx == link.length - 1
        return false unless curr_node.children['*']
      end

      idx += 1
    end

    true
  end
  
end

class Node

  attr_accessor :value, :parent, :children

  def initialize(value,parent)
    @value = value
    @parent = parent
    @children = {}
  end

  def contain?(value)
    @children[value] != nil
  end

  def insert(value)
    @children[value] = Node.new(value,this)
  end

  def insert_end
    @children["*"] = true
  end
end
