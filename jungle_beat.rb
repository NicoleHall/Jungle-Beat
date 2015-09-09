class JungleBeat
  attr_accessor :head, :tail

  def initialize(beats)
    @head = Node.new(beats)
  end

  def append(beats)
    # Find the last node in the JungleBeat (let's call it tail)
    # Assign "beat" to be that ^ node's next node (EG: tail.next_node = Node.new(beat))
    # Return number of beats / nodes added (in this case: 1)
    beats = beats.split # ["Bop", "Dee"]
    beats.each do |beat|
      tail.next_node = Node.new(beat)
    end
    beats.count
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

end

class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
    #a brand new node won't have a next_node
  end
end
