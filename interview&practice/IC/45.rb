# Given an undirected graph ↴ with maximum degree ↴ DD, find a graph coloring ↴ using at most D+1D+1 colors.

require 'set'

class GraphNode

    attr_accessor :label, :neighbors, :color

    def initialize(label)
        @label = label
        @neighbors = Set.new
        @color = nil
    end
end

a = GraphNode.new "a"
b = GraphNode.new "b"
c = GraphNode.new "c"

a.neighbors.add(b)
b.neighbors.add(a)
b.neighbors.add(c)
c.neighbors.add(b)

graph = [a, b, c]

COLORS = [
  'red',
  'white',
  'white',
  'blue',
  'yellow',
  'green',
  'maroon',
  'lavender',
  'turquoise'
]

def colorize(graph)
  length = 0
  graph.each {|x| length = x.neighbors.length if x.neighbors.length > length }

  colors = COLORS[0..length + 1]

  graph.each do |node|

    illegal_colors = Set.new

    node.neighbors.each do |neighbor|
      illegal_colors.add(neighbor.color) unless neighbor.color.nil?
    end

    colors.each do |color|
      unless illegal_colors.include(color)
        node.color = color
        break
      end
    end
  end
end

# How it works:

# This solution iterates over the graph, finds all illegal colors,
# then assigns the first legal one. This takes O(n + m) time, where
# n is the number of nodes, and m is the edges.
