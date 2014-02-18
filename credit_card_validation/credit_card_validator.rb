class CreditCardValidator
  def self.validate credit_card
    nums = []
    credit_card.number.split('').reverse.each_slice(2) do |pair|
      nums << pair[0].to_i << pair[1] = pair[1].to_i*2
    end
    sum = nums.to_s.split('').inject(0){|sum,element| sum += element.to_i}
    (sum%10==0)?true:false
  end
end
