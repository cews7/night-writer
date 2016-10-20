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
  end

  def test_translate_works_with_a_phrase
    english_to_braille = EnglishToBraille.new
    assert_equal [[".0", "0.", ".0", ".0", "..", ".0", ".0", "..", ".0", "0.", "00", "0.", "..", ".0", "0.", "00", ".0", "..", ".0", "0.", ".0", ".0", "..", ".0", ".0", "..", ".0", "0.", "00", "0.", "..", ".0", "0.", "00", ".0"], ["00", "00", "0.", "0.", "..", "0.", "0.", "..", "0.", ".0", "..", ".0", "..", "00", ".0", "..", "00", "..", "00", "00", "0.", "0.", "..", "0.", "0.", "..", "0.", ".0", "..", ".0", "..", "00", ".0", "..", "00"], ["0.", "..", "..", "0.", "..", "..", "0.", "..", "0.", "0.", "0.", "..", "..", "0.", "..", "00", "0.", "..", "0.", "..", "..", "0.", "..", "..", "0.", "..", "0.", "0.", "0.", "..", "..", "0.", "..", "00", "0."]], english_to_braille.translate("this is some text this is some text")
  end
end
