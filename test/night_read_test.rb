require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'
require 'pry'

class NightReadTest < Minitest::Test
  def test_night_read_class_exists
    input = "inputfile.txt"
    output = "outputfile.txt"
    assert_instance_of NightRead, NightRead.new(input, output)
  end

  def test_night_read_can_take_input_file
    text = File.readlines("./test/data/english.txt", "r")
    night_read = NightRead.new("./test/data/braille.txt", "./test/data/english.txt")
    refute_equal nil, text
  end

  def test_night_write_accurately_counts_characters
    night_read = NightRead.new("./test/data/braille.txt", "./test/data/english.txt")
    assert_equal 53, night_read.braille_to_english
  end
end
