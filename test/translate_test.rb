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

  def test_english_to_braille_takes_single_letter_word
    t = Translate.new
    assert_equal "0.\n..\n..", t.english_to_braille("a")
  end

  def test_english_to_braille_takes_multi_letter_word
    t = Translate.new
    assert_equal "0..0\n..00\n..0.", t.english_to_braille("at")
    assert_equal "0.00000.0.\n..0.0.0..0\n..0.0.0...", t.english_to_braille("apple")
  end

  def test_english_to_braille_takes_numbers
    t = Translate.new
    assert_equal ".0.0\n000.\n....", t.english_to_braille("1")
  end

  def test_translate_works_for_phrases
     t = Translate.new
     assert_equal "..0.0.00...00.0.0.0...0.0.0.0....0.0..0...000.0.0..00.\n..00.0.0..0000.000.0..00.000.0..0.0.......0.0000..0..0\n.0....00..0.....0.........0.......0.......0...0...0..." , t.english_to_braille("Hey there here is a phrase")
   end

  def test_english_to_braille_method_creates_formatted_text_file
    skip
  end
end
