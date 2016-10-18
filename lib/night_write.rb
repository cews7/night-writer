require './lib/english_to_braille'
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
    @text = File.readlines(input_file)
    file_chars = text.flatten.each do |line|
      line.strip!
    end.join("").size
    p "Created #{output_file} containing #{file_chars} characters"
  end
end

running_file = ($PROGRAM_NAME == __FILE__)

if running_file
  input_file = ARGV[0]
  output_file = ARGV[1]
  NightWrite.new(input_file, output_file).output_to_terminal
end
