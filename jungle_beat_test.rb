require_relative 'jungle_beat'
require 'minitest/autorun'
require 'minitest/pride'

class JungleBeatTest < Minitest::Test

  def test_there_is_a_Jungle_Beat_class
    assert JungleBeat
  end

  def test_a_new_Jungle_Beat_is_initialized_with_a_head
    jb = JungleBeat.new(Node.new("Beep"))
    assert_equal "Beep", jb.head.data
  end

  def test_the_head_is_the_tail_on_a_Jungle_Beat_with_1_item
    jb = JungleBeat.new(Node.new("Beep"))
    assert_equal "Beep", jb.tail.data
  end

  def test_it_can_append_a_new_node
    jb = JungleBeat.new(Node.new("Beep"))
    jb.append(Node.new("Bop"))
    assert_equal "Bop", jb.tail.data
  end

  def test_it_can_append_two_new_nodes
    jb = JungleBeat.new(Node.new("Beep"))
    jb.append(Node.new("Bop"))
    jb.append(Node.new("Dub"))
    assert_equal "Dub", jb.tail.data
  end

  def test_it_can_prepend_a_new_node
    jb = JungleBeat.new(Node.new("Beep"))
    jb.prepend(Node.new("Dee"))
    assert_equal "Dee", jb.head.data
  end

  def test_it_can_prepend_and_append
    jb = JungleBeat.new(Node.new("Beep"))
    jb.prepend(Node.new("Dee"))
    jb.append(Node.new("Zoop"))
    assert_equal "Zoop", jb.tail.data
    assert_equal "Dee", jb.head.data
  end

  def test_it_can_print_out_the_data_within_the_nodes
    jb = JungleBeat.new(Node.new("Beep"))
    assert_equal "Beep", jb.print_node_data
  end

end

class NodeTest < Minitest::Test

  def test_there_is_a_Node_class
    assert Node
  end

end
