require './lib/alphabet'

class EnglishToBraille
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
  end

  def translate(input)
    split_word = input.split("")
    translate_each_letter = split_word.map do |letter|
      letters.alphabet[letter]
    end
    translated = translate_each_letter.transpose
    "#{translated[0].join}\n" +
    "#{translated[1].join}\n" +
    "#{translated[2].join}"
  end
end
