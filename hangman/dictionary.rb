class Dictionary

  attr_accessor :words

  def initialize(length = nil)
    @words = []
    if length
      load_words("./dictionary/#{length.to_s}")
    else
      @words
    end
  end

  def size
    @words.length
  end

  def filter_by_char char
    @words = @words.select { |word| !word.include?(char) }
  end

  def filter_by_pattern pattern
    regex = /#{pattern.gsub("*","[[:upper:]]")}/
    @words = @words.select { |word| !word.match(regex).nil? }
  end

  def chars_frequency( excludeds = [] )
    frequency = {}
    ("A".."Z").to_a.each do |char|
      next if excludeds.include?(char)
      @words.each do |word|
        if frequency[char]
          frequency[char] += 1 if word.include?(char)
        else
          frequency[char] = 1 if word.include?(char)
        end
      end
    end
    frequency
  end

  private
   def load_words file_path
      file = File.open(file_path)
      while (line = file.gets)
        word = line.gsub("\n","")
        @words << word.upcase
      end
      file.close
   end

end
