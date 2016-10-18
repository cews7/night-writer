require './lib/alphabet'
require 'pry'
class BrailleToEnglish
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
  end

  def translate(input)
    split_braille_first = input.split("\n")
    split_braille = []
    until split_braille_first < 1
      split_braille << string[0..1]
      split_braille_first.shift
      split_braille_first.shift
    end
    # split_braille_first.each do |string|
    #   split_braille << string[2..-1]
    # end
    split_braille.join(", ")
    split_braille = split_braille.each_slice(3).to_a
    content = []


    split_braille.each do |letter|
      binding.pry
    if letters.alphabet.has_value?(letter)
      # letters.alphabet.each do |key, value|
        
        if letters.alphabet.values == letter
          content << key
        end
      final = content.join("")
      
    end
  end
end
end
