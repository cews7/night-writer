require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'

class NightReadTest < Minitest::Test
  def test_night_read_class_exists
    assert_instance_of NightRead, NightRead.new
  end
end
