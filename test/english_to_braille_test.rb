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

  def test_translate_works_with_a_letter
    english_to_braille = EnglishToBraille.new
    expected = "0.0.\n....\n...."
    assert_equal expected, english_to_braille.translate(["aa"])
  end

  def test_translate_works_with_caps
    english_to_braille = EnglishToBraille.new
    expected = "..0.\n....\n.0.."
    assert_equal expected, english_to_braille.translate(["A"])
  end

  def test_translates_works_with_numbers
    english_to_braille = EnglishToBraille.new
    expected = ".00.\n.0..\n00.."
    assert_equal expected, english_to_braille.translate(["1"])
  end

  def test_translate_works_with_phrase
    english_to_braille = EnglishToBraille.new
    expected = "0.0.00\n00.0.0\n....00"
    assert_equal expected, english_to_braille.translate(["hey"])
  end
end
