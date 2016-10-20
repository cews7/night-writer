require './lib/alphabet'
require 'pry'
class BrailleToEnglish
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
  end

  def braille_to_string(input)
    joined_braille = input.join
    split_braille_first = joined_braille.split("\n")
    split_into_letters(split_braille_first)
  end

  def split_into_letters(split_braille_first)
    repeats = split_braille_first[0].length / 2
    split_braille = []
    repeats.times {cut(split_braille, split_braille_first)}
    values = split_braille.each_slice(3).to_a
    translate(values)
  end

  def cut(split_braille, split_braille_first)
    split_braille_first.each do |string|
      split_braille << string[0..1]
      string.slice!(0)
      string.slice!(0)
    end
  end

  def grab_values(braille_char, content)
    letters.alphabet.each do |key, value|
      content << key if value == braille_char
    end
    content
  end

  def translate(values)
    content = []
    values.each {|braille_char| grab_values(braille_char, content)}
    content = content.flatten.join
    caps(content)
  end

  def caps(content)
    100000.times do
      caps_replacement(content)
    end
    nums(content)
  end

  def caps_replacement(content)
    if content.include?("^")
      index = content.index("^")
      caps = content[index+1].capitalize!
      content[index+1] = caps
      content.slice!(index)
    end
  end

  def nums(content)
    100000.times do
      nums_replacement(content)
    end
    content
  end

  def nums_replacement(content)
    if content.include?("#")
      index = content.index("#")
      nums = content[index+1].ord - 96
      nums = nums.to_s
      content[index+1] = nums
      content.slice!(index)
    end
  end
end
