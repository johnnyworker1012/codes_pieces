require 'spec_helper'

describe Dictionary do
  describe '#initialize' do
    context 'initialize with params' do
      it 'should be initialized by the word length' do
        dictionary = Dictionary.new 1
        dictionary.size.should == 26
        dictionary = Dictionary.new 24
        dictionary.size.should == 6
      end
    end

    context 'initialize without params' do
      it 'should initialize a empty array' do
        dictionary = Dictionary.new
        dictionary.size.should == 0
      end
    end

  end

  describe '#size' do
    it 'should return the size of the dictionary' do
      dictionary = Dictionary.new 1
      dictionary.size.should == 26
    end
  end

  describe '#filter_by_char' do
    it 'should return words which do not contain the letter' do
      dictionary = Dictionary.new
      dictionary.words = [ "YAWNY", "YAZOO", "ZABRA", "ZABTI", "ZAMAN" ]
      dictionary.filter_by_char("Z")
      dictionary.words.should == [ "YAWNY" ]
    end
  end

  describe '#filter_by_pattern' do
    it 'should return all words that match the pattern' do
         dictionary = Dictionary.new
         dictionary.words = [ "YAWNY", "YAZOO", "ZABRA", "ZABTI", "ZAMAN" ]
         dictionary.filter_by_pattern("ZA***")
         dictionary.words.should == [ "ZABRA", "ZABTI", "ZAMAN" ]
    end
  end

  describe '#chars_frequency' do
    it 'should return chars frequency of the current dictionary' do
      dictionary = Dictionary.new
      dictionary.words = [ "CAPPY", "COPPY", "CUPPY", "DUPPY", "FOPPY" ]
      dictionary.chars_frequency(["P"]).should == {"A"=>1, "C"=>3, "D"=>1, "F"=>1, "O"=>2, "U"=>2, "Y"=>5}
    end
  end

end
