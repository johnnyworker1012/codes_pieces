require "spec_helper"

describe CreditCard do
  it 'initialize a new credit card with card number' do
    card = CreditCard.new('5105 1051 0510 5106')
    card.number.should_not be_nil
  end

  it 'card number should not include space' do
    card = CreditCard.new('5105 1051 0510 5106')
    card.number.include?(" ").should == false
  end

  describe 'card types' do
    it 'can identify AMEX card' do
      card=CreditCard.new('3782 8224 6310 005')
      card.type.should=='AMEX'
    end

    it 'can identify Discover card' do
      card = CreditCard.new('6011 1111 1111 1117')
      card.type.should == 'Discover'
    end

    it 'can identify Master card' do
      card = CreditCard.new('5105 1051 0510 5106')
      card.type.should == 'MasterCard'
    end

    it 'can identify Visa card' do
      card = CreditCard.new('4012 8888 8888 1881')
      card.type.should == 'VISA'
    end

    it 'can identify unknown card' do
      card=CreditCard.new('9111 1111 1111 1111')
      card.type.should=='Unknown'
    end

  end
end
