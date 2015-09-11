require_relative '../lib/jungle_beat'
require 'minitest/autorun'
require 'minitest/pride'

class JungleBeatTest < Minitest::Test

  def test_there_is_a_Jungle_Beat_class
    assert JungleBeat
  end

  def test_a_new_Jungle_Beat_is_initialized_with_a_head
    jb = JungleBeat.new("Beep")
    assert_equal "Beep", jb.head.beat
  end

  def test_it_can_append_a_new_node
    jb = JungleBeat.new("Beep")
    assert_equal jb.append("Bop"), 1
    assert_equal "Bop", jb.tail.beat
  end

  def test_it_can_append_two_new_nodes
    jb = JungleBeat.new("Beep")
    assert_equal jb.append("Bop Dee"), 2
    assert_equal "Dee", jb.tail.beat
  end

  def test_the_head_is_the_tail_on_a_Jungle_Beat_with_1_item
    jb = JungleBeat.new("Beep")
    assert_equal "Beep", jb.tail.beat
  end

  def test_it_can_prepend_a_new_node
    jb = JungleBeat.new("Beep")
    assert_equal 2, jb.prepend("Dee")
  end

  def test_it_can_prepend_a_two_nodes
    jb = JungleBeat.new("Beep")
    assert_equal 3, jb.prepend("Dee Da")
    assert_equal "Beep", jb.tail.beat
    assert_equal "Dee", jb.head.beat
  end

  def test_include_evaluates_to_true_when_beat_is_present_and_false_when_it_is_not_presetn
    jb = JungleBeat.new("Beep")
    assert jb.include?("Beep")
    refute jb.include?("Da")
  end

  def test_include_works_with_prepend_and_append
    jb = JungleBeat.new("Beep")
    jb.append("Um Dee Zee")
    assert jb.include?("Beep")
    assert jb.include?("Zee")
    refute jb.include?("Da")
  end

  def test_all_returns_all_beats_in_order
    jb = JungleBeat.new("Beep")
    jb.append("Um Dee Zee")
    jb.prepend("Deep")
    assert_equal "Deep Beep Um Dee Zee", jb.all
  end

  def test_count_adds_up_all_of_the_beats
    jb = JungleBeat.new("Beep")
    jb.append("Um Dee Zee")
    jb.prepend("Deep")
    jb.prepend("Deep Deep")
    assert_equal 7, jb.count
  end

  def test_remove_last_beat_removes_one_item
    jb = JungleBeat.new("Beep")
    jb.append("La")
    jb.append("Zee")
    assert_equal "Zee", jb.remove_last_beat
  end

  def test_two_items_can_be_popped_from_the_list
    jb = JungleBeat.new("Beep")
    jb.append("Zee")
    jb.append("Da")
    assert_equal "Zee Da", jb.pop(2)
  end

  def test_it_can_find_one_thing_that_is_the_first_thing_in_the_list
    jb = JungleBeat.new("Beep")
    jb.append("Zee")
    jb.append("Da")
    jb.append("Da")
    assert_equal "Beep", jb.find(0, 1)
  end

  def test_it_can_insert_node_at_position_2
    jb = JungleBeat.new("Beep")
    jb.append("Zee")
    jb.append("Da")
    jb.append("Blah")
    assert_equal "Beep Zee Sing Da Blah", (jb.insert(2, "Sing"))
  end

  def test_it_can_play
    jb = JungleBeat.new("Beep")
    jb.append("ding, dah, oom, oom, ding, oom, oom, oom, ding, dah, oom, oom, ding, dah, oom, oom, ding, dah, oom, oom ")
    assert_equal 21, jb.count
    string_of_all_beats = jb.all
    assert_equal "", jb.play
  end

end

class NodeTest < Minitest::Test

  def test_there_is_a_Node_class
    assert Node
  end

end
