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

def translate(input)
  split_word = input.split("")
  input_hash = split_word.group_by do |letter|
    letters.alphabet[letter][0..2]
  end.invert 
   nested_array_of_braille = input_hash.each do |letter|
     letter
      end.values 
    #grab the first element in the first array then grab the first element in second array
    #put both sets into a single string
    #repeat until both arrays are empty 
    
    #extract index zero from all letters 
    #remove index zero from all letters 
    #repeat 

    formatted = nested_array_of_braille.each do |letter|
      letter[0]
      nested_array_of_braille.shift
    end
    formatted
        
end









#  def translate(word)
#    letters = word.split("")
#      puts "#{alphabet[letters[0]][0]}#{alphabet[letters[1]][0]}"
#      puts "#{alphabet[letters[0]][1]}#{alphabet[letters[1]][1]}"
#      puts "#{alphabet[letters[0]][2]}#{alphabet[letters[1]][2]}"
#    letters.join("")
#    end
   
end

