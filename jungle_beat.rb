class JungleBeat
  attr_accessor :head, :tail

  def initialize(head)
    @head = head
    @tail = tail
    #a brand new JungleBeat list will come with a @head.  A Node.new w/ its string argument must be passed in.  the list only contains one node upon initialize, so it is the head and the tail
  end

  def append(node)
    @tail.next_node = node
    @tail = @tail.next_node
  end

  def prepend(prepend_node)
    prepend_node = prepend_node
    prepend_node.next_node = @head
    @head = prepend_node
  end

  def tail
    current_node = @head
    while current_node.next_node
      current_node = current_node.next_node
    end
    current_node
  end

  def print_node_data
    current_node = @head
    while current_node != nil
      "#{current_node.data}"
      current_node = current_node.next_node
    end
  end

end

class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
    #a brand new node won't have a next_node
  end
end

jb = JungleBeat.new(Node.new("Beep"))
puts jb.print_node_data
require 'pry'
binding.pry
