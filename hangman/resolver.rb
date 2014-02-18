require './dictionary'

class Resolver
  attr_accessor :failed_guesses, :right_guesses,
              :last_feedback, :last_guess, :dictionary

  def initialize(word)
    @failed_guesses = []
    @right_guesses = []
    @last_feedback = word
    @dictionary = Dictionary.new(word.length)
  end

  #this table is pre-calculated by best_guess() method based on the dictionary
  def init_guess
    init_guess_table = { 1 => "A", 2 => "A", 3 => "A",  4 => "A", 5 => "S",
                   6 => "E", 7 => "E", 8 => "E", 9 => "E", 10 => "E",
                   11 => "E", 12 => "E", 13 => "I", 14 => "I", 15 => "I",
                   16 => "I", 17 => "I", 18 => "I", 19 => "I", 20 => "I",
                   21 => "O", 22 => "O", 23 => "O", 24 => "O", 28 => "I" }
    @last_guess = init_guess_table[@last_feedback.length]
  end

  def next_guess(feedback)
    if @last_feedback == feedback
      @failed_guesses << @last_guess
      @dictionary.filter_by_char @last_guess
    else
      @dictionary.filter_by_pattern feedback
      @right_guesses = right_chars(feedback)
    end
    @last_feedback = feedback
    @last_guess = best_guess
  end

  def best_guess
    char_frequency = @dictionary.chars_frequency(@right_guesses)
    if char_frequency == {}
      (("A".."Z").to_a - @right_guesses - @failed_guesses).sample
    else
      char_frequency.max_by{|k, v| v}[0]
    end
  end

  def right_chars pattern
    pattern.gsub("*","").split("").uniq
  end

end
