require './lib/english_to_braille'
require 'pry'
class NightWrite
  attr_reader :input_file,
              :output_file,
              :text

  def initialize(input, output)
    @input_file  = input
    @output_file = output
  end

  def braille_character_count
    file_chars = text.flatten.each { |line| line.strip! }.join("").size
    puts output(output_file,file_chars)
    file_chars * 6 
  end

  def output(output_file,file_chars)
    "Created #{output_file} containing #{file_chars.*(6)} characters"
  end

  def english_to_braille
    file_name = ARGV[0] || "message.txt"
    @text = File.readlines(file_name)
    braille_character_count
    created_braille_file
  end

  def created_braille_file
    english_to_braille = EnglishToBraille.new
    braille = english_to_braille.translate(text)
    file_name = ARGV[1] || "braille.txt"
    handle = File.open(file_name, "w")
    handle.write(braille)
    handle.close
  end
end

running_file = ($PROGRAM_NAME == __FILE__)

if running_file
  input_file = ARGV[0]
  output_file = ARGV[1]
  NightWrite.new(input_file, output_file).english_to_braille
end
