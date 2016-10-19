require './lib/alphabet'
require 'pry'
class BrailleToEnglish
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
  end
  def translate(input)
    joined_braille = input.join
    split_braille_first = joined_braille.split("\n")
    split_braille = []
    repeats = split_braille_first[0].length/2
    repeats.times do
      split_braille_first.each do |string|
        split_braille << string[0..1]
        string.slice!(0)
        string.slice!(0)
      end
    end
    split_braille.join(", ")
    split_braille = split_braille.each_slice(3).to_a
    content = []
    split_braille.each do |braille_char|
      letters.alphabet.each do |key, value|
        if letters.alphabet.has_value?(braille_char)
          if value == braille_char
            content << key
          end
        end
      end
    end
    content.flatten.join("")
  end
end
