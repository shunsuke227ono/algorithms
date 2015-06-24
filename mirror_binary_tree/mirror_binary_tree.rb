require './binary_tree'

class MirrorBinaryTree < BinaryTree
  def initialize(array)
    @nodes = array.map{ |x| MirrorBinaryTree::Node.new(x) }
    set_children
  end
  def root
    @nodes[0]
  end
  def mirror(current_node=@nodes[0])
    current_node.swap
    mirror(current_node.left) unless current_node.left.nil?
    mirror(current_node.right) unless current_node.right.nil?
  end
  def node_values
    @nodes.map(&:value)
  end
  def set_array_of_nodes(current_node=root, i=0)
    @nodes[i] = current_node
    set_array_of_nodes(current_node.left, i*2+1) unless current_node.left.nil?
    set_array_of_nodes(current_node.right, i*2+2) unless current_node.right.nil?
  end
  class Node < BinaryTree::Node
    def swap
      if !self.right.nil? || !self.left.nil?
        temp = self.left
        self.left = self.right
        self.right = temp
      end
    end
  end
end

counter = 0
while str = STDIN.gets
  break if str.chomp == "exit"
  array = str.chomp.split(' ').map(&:to_i) if counter == 0
  counter += 1
end

binary_tree = MirrorBinaryTree.new(array)
p binary_tree.node_values
binary_tree.mirror
binary_tree.set_array_of_nodes
p binary_tree.node_values

