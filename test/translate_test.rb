require 'minitest/autorun'
require 'minitest/pride'
require './lib/translate'
require 'pry'


class TranslateTest < Minitest::Test
  def test_translate_class_exists
    assert_instance_of Translate, Translate.new 
  end

  def test_translate_class_has_access_to_alphabet
    translate = Translate.new 
    alphabet = translate.letters.alphabet
    refute_equal nil, alphabet
    #add another assertion to varify that the hash actually contains correct information 
  end

  def test_a_translate_to_braille
    t = Translate.new 
    assert_equal [["0.", "..", ".."]], t.translate("a")
  end

  def test_a_multi_letter_word_translates_to_braille
    t = Translate.new 
    assert_equal [["0.", "..", ".."], [".0", "00", "0."]], t.translate("at")
  end

  def test_translate_formats_braille
    t = Translate.new 
    assert_equal "0..0\n..00\n..0.", t.translate("at")
  end
end