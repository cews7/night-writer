require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_to_english'

class BrailleToEnglishTest < MiniTest::Test
  def test_braille_to_english_class_exists
    assert_instance_of BrailleToEnglish, BrailleToEnglish.new
  end

  def test_translate_on_one_braille_character
    t = BrailleToEnglish.new
    assert_equal "a", t.translate("0.\n..\n..")
  end

  def test_translate_on_multiple_braille_characters
    t = BrailleToEnglish.new
    assert_equal "ab", t.translate("0.0.\n..0.\n....")
  end

  def test_translate_on_multiple_braille_characters
    t = BrailleToEnglish.new
    assert_equal "apple", t.translate("0.00000.0.\n..0.0.0..0\n..0.0.0...")
  end


  def test_translate_works_with_phrase
    t = BrailleToEnglish.new
    assert_equal "hey there here is a phrase", t.translate("0.0.00...00.0.0.0...0.0.0.0....0.0..0...000.0.0..00.\n00.0.0..0000.000.0..00.000.0..0.0.......0.0000..0..0\n....00..0.....0.........0.......0.......0...0...0...")
  end

  def test_translate_works_with_two_letters
    t = BrailleToEnglish.new
    assert_equal "at", t.translate("0..0\n..00\n..0.")
  end

  def test_translate_takes_in_a_file
    t = BrailleToEnglish.new
    assert_equal ""
  end
end
