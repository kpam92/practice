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
end
