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
    text = File.readlines("message.txt", "r")
    night_write = NightWrite.new("message.txt", "braille.txt")
    refute_equal nil, text
  end

  def test_night_write_accurately_counts_characters
    night_write = NightWrite.new("message.txt", "braille.txt")
    night_write.english_to_braille
    assert_equal 102, night_write.real_chars
  end
end
