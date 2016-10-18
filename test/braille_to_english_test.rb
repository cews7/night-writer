require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_to_english'

class BrailleToEnglishTest < MiniTest::Test
  def test_braille_to_english_class_exists
    assert_instance_of BrailleToEnglish, BrailleToEnglish.new
  end

  def test_translate_on_one_braille_character
    skip
    t = BrailleToEnglish.new
    assert_equal "a", t.translate("0.\n..\n..")
  end

  def test_translate_on_multiple_braille_characters
    t = BrailleToEnglish.new
    assert_equal "apple", t.translate("0.00000.0.\n..0.0.0..0\n..0.0.0...")
  end
end
