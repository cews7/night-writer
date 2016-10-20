require './lib/braille_to_english'
require 'pry'
class NightRead
  attr_reader :input_file,
              :output_file,
              :text
  def initialize(input, output)
    @input_file  = input
    @output_file = output
  end

  def braille_to_english
    file_name = ARGV[0] || "braille.txt"
    @text = File.readlines(file_name)
    file_chars = text.flatten.each { |line| line }.join("").size
    @real_chars = file_chars / 6
    character_check(file_chars)
  end

  def character_check(file_chars)
    if @real_chars > 80
      print "Sorry, that's too many characters!"
    else
      created_english_file
      output(output_file, file_chars)
    end
  end

  def output(output_file, file_chars)
    p "Created #{output_file} containing #{file_chars / 6} characters"
  end

  def created_english_file
    braille_to_english = BrailleToEnglish.new
    braille = braille_to_english.braille_to_string(text)
    file_name = ARGV[1] || "message.txt"
    handle = File.open(file_name, "w")
    handle.write(braille)
    handle.close
  end
end

running_file = ($PROGRAM_NAME == __FILE__)

if running_file
  input_file = ARGV[0]
  output_file = ARGV[1]
  NightRead.new(input_file, output_file).braille_to_english
end
