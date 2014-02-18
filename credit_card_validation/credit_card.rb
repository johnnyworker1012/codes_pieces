class CreditCard

  attr_reader :number, :type

  def initialize(number)
    @number = number.gsub(" ","")
    identify_type
  end

  private
   def identify_type
      len = @number.length
      case
      when /^(34|37)/ =~ @number && len == 15
        @type = 'AMEX'
      when /^6011/ =~ @number && len == 16
        @type = 'Discover'
      when /^5[1-5]/ =~ @number && len == 16
        @type='MasterCard'
      when /^4/ =~ @number && (len == 13 || len == 16 )
        @type = 'VISA'
      else
        @type = "Unknown"
      end
   end

end
