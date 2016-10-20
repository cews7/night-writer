require './lib/alphabet'
require 'pry'
class EnglishToBraille
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
  end

  def translate(input)
    split_word = input.join.chars
    translate_each_letter = split_word.map do |letter|
      letters.alphabet[letter]
    end
    t = translate_each_letter.transpose
    "#{t[0].join}\n" + "#{t[1].join}\n" + "#{t[2].join}"
  end
end
