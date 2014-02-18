require 'spec_helper'

describe 'CreditCardValidator' do
   describe 'VISA card validation' do
     it_should_behave_like "credit card validation", "4111111111111111", true
     it_should_behave_like "credit card validation", "4111111111111", false
     it_should_behave_like "credit card validation", "4012888888881881", true
   end

   describe 'AMEX card validation' do
     it_should_behave_like "credit card validation", "378282246310005", true
   end

   describe 'Discover card validation' do
     it_should_behave_like "credit card validation", "6011111111111117", true
   end

   describe 'Master card validation' do
     it_should_behave_like "credit card validation", "5105105105105100", true
     it_should_behave_like "credit card validation", "5105105105105106", false
   end

   describe 'Unknown card validation' do
     it_should_behave_like "credit card validation", "9111111111111111", false
   end

end

describe 'validation of an actual credit card with the validator' do
  describe 'VISA card' do

    let(:card) { CreditCard.new('4111 1111 1111 1111') }

    it 'should be visa type' do
      card.type.should == "VISA"
    end

    it 'should be true if the card number is valid' do
      CreditCardValidator.validate(card).should == true
    end
  end
end
