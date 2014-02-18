require "spec_helper"

def random_split(array, max) 
  array = array.clone 
  result = []
  result << array.pop(Random.rand(1..max)) while array.count > 0
  result
end


describe "#random_split" do

  let(:array) { (1..20).to_a }
  let(:max) { 5 }
  let(:result) { random_split(array, max)  }
  subject {result}
  
  it {should be_a_kind_of(Array)}

  it 'each element should be not longer than the max length' do
    result.each do |element|
      element.count.to_s.should =~ /[1-max]/
    end
  end

  it 'should have same length' do
    result.flatten.count.should == array.count
  end

end
