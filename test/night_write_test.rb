require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class NightWriteTest < Minitest::Test
  def test_night_write_class_exists
    input = "inputfile.txt"
    output = "outputfile.txt"
    assert_instance_of NightWrite, NightWrite.new(input, output)
  end

  def test_night_write_can_take_input_file
    text = File.open("message.txt", "r")
    night_write = NightWrite.new("message.txt", "braille.txt")
    refute text == nil
  end

  def test_night_write_accurately_counts_characters
    text = File.open("message.txt")
    night_write = NightWrite.new("message.txt", "braille.txt")
    assert_equal "Created braille.txt containing 51 characters", night_write.english_to_braille
  end
end
