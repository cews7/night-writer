require './lib/braille_to_english'
require 'pry'
class NightWrite
  attr_reader :input_file,
              :output_file
  attr_accessor :text
  def initialize(input, output)
    @input_file = input
    @output_file = output
  end

  def output_to_terminal_braille_to_english
    @text = File.readlines(ARGV[0])
    file_chars = text.flatten.each do |line|
      line
    end.join("").size
    p "Created #{output_file} containing #{file_chars / 6} characters"
    created_english_file
  end

  def created_english_file
    braille_to_english = BrailleToEnglish.new
    braille = braille_to_english.translate(text)
    handle = File.open(ARGV[1], "w")
    handle.write(braille)
    handle.close
  end
end

running_file = ($PROGRAM_NAME == __FILE__)

if running_file
  input_file = ARGV[0]
  output_file = ARGV[1]
  NightWrite.new(input_file, output_file).output_to_terminal_braille_to_english
end
