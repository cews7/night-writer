require './lib/alphabet'
require 'pry'
class Translate
  attr_reader :letters
  def initialize
    @letters = Alphabet.new
  end


  #How to Translate from english to braille
  #1. Translate method needs to take a word to run an action on
  #2. That word needs to be split up into characters
  #3. Print the zero index element of each translated character
  #4. Create a new line after 160 characters
  #5. Print the one index element of each translated character
  #6. Create a new line after 160 characters
  #7. Print the second index element of each translated character
  #8. Repeat for as many lines of English as needed

  def english_to_braille(input)
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
