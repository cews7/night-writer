require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_to_english'

class BrailleToEnglishTest < MiniTest::Test
  def test_braille_to_english_class_exists
    assert_instance_of BrailleToEnglish, BrailleToEnglish.new
  end

  def test_braille_is_a_string
    b = BrailleToEnglish.new
    assert_equal "a", b.braille_to_string(["0.", "..", ".."])
  end

  def test_braille_is_split_into_letters
    b = BrailleToEnglish.new
    assert_equal "aa", b.braille_to_string(["0...", "..0.", "...."])
  end

  def test_braille_translates_phrase_word
    b = BrailleToEnglish.new
    assert_equal "hey", b.braille_to_string(["0.00..", "0..0..", "00.000"])
  end

  def test_braille_translates_caps
  end

  def test_braille_translates_numbers
    b = BrailleToEnglish.new
    assert_equal "1", b.braille_to_string([".0.000", "0....."])
  end

  def test_braille_translates_phrases
  end
end
