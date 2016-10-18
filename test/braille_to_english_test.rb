require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_to_english'

class BrailleToEnglishTest < MiniTest::Test
  def test_braille_to_english_class_exists
    skip
    assert_instance_of BrailleToEnglish, BrailleToEnglish.new
  end

  def test_translate_on_one_braille_character
    skip
    t = BrailleToEnglish.new
    assert_equal "a", t.translate("0.\n..\n..")
  end

  def test_translate_on_multiple_braille_characters
    skip
    t = BrailleToEnglish.new
    assert_equal "apple", t.translate("0.00000.0.\n..0.0.0..0\n..0.0.0...")
  end

  def test_translate_works_with_two_letters
    skip
    t = BrailleToEnglish.new
    assert_equal "at", t.translate("0..0\n..00\n..0.")
  end

  def test_translate_works_with_caps
    t = BrailleToEnglish.new
    assert_equal "Hey there here is a phrase", t.translate("..0.0.00...00.0.0.0...0.0.0.0....0.0..0...000.0.0..00.\n..00.0.0..0000.000.0..00.000.0..0.0.......0.0000..0..0\n.0....00..0.....0.........0.......0.......0...0...0...")
  end
end
