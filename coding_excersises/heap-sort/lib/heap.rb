class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc|| Proc.new {|x,y| x <=> y}
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
    @store.push(val)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    [(2*parent_index) + 1, (2*parent_index) + 2].select {|x| x < len}
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    parent = array[self.parent_index(child_idx)]
    prc = prc|| Proc.new {|x,y| x  <=> y}
    until prc.call(array[self.parent_index(child_idx)], array[child_idx]) >= 0
      array[child_idx],array[self.parent_index(child_idx)] = array[self.parent_index(child_idx)], array[child_idx]
    end
    array
  end
end
