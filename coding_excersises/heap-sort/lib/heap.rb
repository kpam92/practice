class BinaryMinHeap
  def initialize(&prc)
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
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
  end
end
