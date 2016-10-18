require './lib/lower_case_alphabet'
require 'pry'
require './lib/upper_case_alphabet'
class BrailleToEnglish
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
    @big_letters = UpperCase.new
  end

  def translate(input)
    split_braille_first = input.split("\n")
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
    # binding.pry
    content = []
    split_braille.each do |braille_char|
      letters.alphabet.each do |key, value|
        if letters.alphabet.has_value?(braille_char)
          if value == braille_char
          content << key
        # binding.pry
        #   elsif split_braille.include?(["..", "..", ".0"])
        #     place = split_braille.index(["..", "..", ".0"])
        #     capital = split_braille[place+1]
        #   # binding.pry
        #     content << key.upcase
        # end
      end

  end
  end

  end
  content.flatten.join("")
end
end
