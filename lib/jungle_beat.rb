class JungleBeat
  attr_accessor :head, :tail

  def initialize(beats)
    @head = Node.new(beats)
  end

  def append(beats)
    beats = beats.split
    beats.each do |beat|
      tail.next_node = Node.new(beat)
    end
    beats.count
  end

  def prepend(beats)
    beats = beats.split.reverse
    beats = beats.map do |beat|
      previous_head = @head
      @head = Node.new(beat)
      @head.next_node = previous_head
    end
    beats.count + 1
  end

  def tail
    current_node = @head
    while current_node.next_node #until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def include?(beat)
    current_node = @head
    while current_node
      if current_node.beat == beat
        return true
      end
      current_node = current_node.next_node
    end
  end

  def all
    list_of_beats = []
    current_node = @head
    while current_node
      list_of_beats << current_node.beat
      current_node = current_node.next_node
    end
    list_of_beats.join(" ")
  end

  def count
    list_of_beats = []
    current_node = @head
    while current_node
      list_of_beats << current_node.beat
      current_node = current_node.next_node
    end
    list_of_beats.count
  end

  def remove_last_beat
    current_node = @head
    while current_node.next_node.next_node #until this condition is false, do the loop & the condition is looking two ahead
      current_node = current_node.next_node
    end
    removed_node = current_node.next_node
    current_node.next_node = nil
    removed_node.beat
  end

  def pop(num)
    result = []
    num.times do
      result << remove_last_beat
    end
    result.reverse.join(" ")
  end

  def find(position, num_of_beats_to_find)
    found = []
    all.split.each_with_index do |value, index|
      if (index >= position && index < position + num_of_beats_to_find)
        found << value
      end
    end
    found.join
  end

  def play
    command = `say -r 500 -v Boing #{all}`
    sound = command
    #sound = `say -r 500 -v Boing '#{all}'`
    played = "Played #{count} sounds from beats.txt"
    puts played
    sound

  end

  def insert(position, beat)
    current_node = @head
    counter = 1
    while counter < position
      current_node = current_node.next_node
      counter += 1
    end
    new_node = Node.new(beat)
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
    all
  end
end

class Node
  attr_accessor :beat, :next_node

  def initialize(beat)
    @beat = beat
    @next_node = nil
    #a brand new node won't have a next_node
  end
end
