require './lib/alphabet'
require 'pry'
class BrailleToEnglish
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
  end

  def translate(input)
    split_braille = input.split("\n")
    binding.pry
    if letters.alphabet.has_value?(split_braille)
      contents = letters.alphabet.map do |key, value|
        content = []
        if value == split_braille
          content << key
        end
      end.compact.flatten.join("")
    end
  end
end
