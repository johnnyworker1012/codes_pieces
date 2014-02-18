require 'spec_helper'

describe Resolver do

  describe '#initialize' do
    let(:resolver) { Resolver.new('*****') }

    it 'should have a failed guesses array that is empty' do
      resolver.failed_guesses.should == []
    end

    it 'should have a right guesses array that is empty' do
      resolver.right_guesses.should == []
    end

    it 'should have a init feedback as the input' do
      resolver.last_feedback.should == '*****'
    end

    it 'should have an empty last guess' do
      resolver.last_guess.should be_nil
    end

  end

  describe '#best_guess' do
    let(:resolver) { Resolver.new('*****') }

    it 'should return the letter with the highest frequency except right guesses' do
      resolver.dictionary.words = [ "ZONAL", "ZONED", "ZORIL", "ZOQUE", "ZYGON" ]
      resolver.right_guesses = ["Z"]
      #except "Z", "O" has the highest frequency
      resolver.best_guess.should == "O"
    end

    it 'should randomly pick up a guess which is neither guessed and failed when dictionary is null' do
      resolver.dictionary.words = []
      resolver.failed_guesses = ["A","B"]
      resolver.right_guesses = ["C", "R", "E"]
      guess = resolver.best_guess
      guess.should == guess.upcase
      guess.length.should == 1
      resolver.failed_guesses.should_not include(guess)
      resolver.right_guesses.should_not include(guess)
    end

  end

  describe '#init_guess' do
    it 'should return init guess for the n-length letter word' do
      resolver =  Resolver.new('***')
      resolver.init_guess.should == resolver.best_guess

      resolver =  Resolver.new('*'*6)
      resolver.init_guess.should == resolver.best_guess

      resolver =  Resolver.new('*'*9)
      resolver.init_guess.should == resolver.best_guess

      resolver =  Resolver.new('*'*12)
      resolver.init_guess.should == resolver.best_guess

      resolver =  Resolver.new('*'*21)
      resolver.init_guess.should == resolver.best_guess

      resolver =  Resolver.new('*'*28)
      resolver.init_guess.should == "I"
    end
  end

  describe '#right_chars' do
    it 'should return right guessed chars from the pattern' do
      resolver = Resolver.new('*****')
      resolver.right_chars("H*PP*").should == ["H","P"]
    end
  end

  describe '#next_guess' do
    let(:resolver) { Resolver.new('*****') }

    it 'should only return capitial letter' do
      resolver.init_guess
      guess = resolver.next_guess("*****")
      guess.should == guess.upcase
    end

    it 'should return one letter' do
      resolver.init_guess
      guess = resolver.next_guess("*****")
      guess.length.should == 1
    end

    it 'should not return the letter that has been guessed' do
      first_guess = resolver.init_guess
      second_guess = resolver.next_guess("*****")
      first_guess.should_not == second_guess
    end

    context "response of the right guess" do
      it 'should react with the right guesses' do
        #target word: "EAT"
        resolver = Resolver.new("***")
        last_size = resolver.dictionary.size
        init_guess = resolver.init_guess
        init_guess.should == "A"

        next_guess = resolver.next_guess("*A*")
        last_size.should > resolver.dictionary.words.length
        resolver.right_guesses.should == ["A"]
      end
    end

    context "response of the failed guesses" do
      it 'should react with the failed guesses' do
        #target word: "EAT"
        resolver = Resolver.new("***")
        last_size = resolver.dictionary.size
        init_guess = resolver.init_guess
        init_guess.should == "A"

        next_guess = resolver.next_guess("*A*")
        next_guess.should == "T"

        next_guess = resolver.next_guess("*AT")
        next_guess.should == "B"

        resolver.next_guess("*AT")
        last_size.should > resolver.dictionary.size
        resolver.failed_guesses.should == [ "B" ]
      end
    end

  end

end
