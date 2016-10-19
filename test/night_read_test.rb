require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'

class NightReadTest < Minitest::Test
  def test_night_read_class_exists
    assert_instance_of NightRead, NightRead.new
  end

  def test_night_read_can_take_a_file
    n = NightRead.new

    refute_equal nil, n.
  end
end
