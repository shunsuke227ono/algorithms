class BinaryTree
  # suppose input is an array of breadth-first traversal representation of tree
  def initialize(array)
    @nodes = array.map{ |x| Node.new(x) }
    set_children
  end
  private
  def set_children
    @nodes.each_with_index do |n, i|
      n.left = @nodes[i*2+1] unless @nodes[i*2+1].nil?
      n.right = @nodes[i*2+2] unless @nodes[i*2+2].nil?
    end
  end
  class Node
    attr_reader :value
    attr_accessor :left, :right
    def initialize(v)
      @value = v
    end
  end
end
