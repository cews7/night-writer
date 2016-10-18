require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_to_braille'

class EnglishToBrailleTest < Minitest::Test
  def test_english_to_braille_class_exists
    assert_instance_of EnglishToBraille, EnglishToBraille.new
  end

  def test_english_to_braile_class_has_access_to_alphabet
    english_to_braille = EnglishToBraille.new
    alphabet = english_to_braille.letters.alphabet
    refute_equal nil, alphabet
    #add another assertion to varify that the hash actually contains correct information
  end

  def test_translate_takes_single_letter_word
    t = EnglishToBraille.new
    assert_equal "0.\n..\n..", t.translate("a")
  end

  def test_translate_takes_multi_letter_word
    t = EnglishToBraille.new
    assert_equal "0..0\n..00\n..0.", t.translate("at")
    assert_equal "0.00000.0.\n..0.0.0..0\n..0.0.0...", t.translate("apple")
  end

  def test_translate_takes_numbers
    t = EnglishToBraille.new
    assert_equal ".0.0\n000.\n....", t.translate("1")
  end

  def test_translate_takes_phrases
     t = EnglishToBraille.new
     assert_equal "..0.0.00...00.0.0.0...0.0.0.0....0.0..0...000.0.0..00.\n..00.0.0..0000.000.0..00.000.0..0.0.......0.0000..0..0\n.0....00..0.....0.........0.......0.......0...0...0..." , t.translate("Hey there here is a phrase")
   end

  def test_english_to_braille_method_creates_formatted_text_file
    skip
  end
end
