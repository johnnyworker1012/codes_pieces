shared_examples 'credit card validation' do |card_number, validity|
  it 'should be a valid credit card' do
    credit_card = double('credit card', :number => card_number)
    CreditCardValidator.validate(credit_card).should == validity
  end
end
