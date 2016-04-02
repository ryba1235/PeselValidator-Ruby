class PeselValidator
	#opracowane na podstawie https://github.com/voytee/activepesel
	DIGIT_WEIGHTS = [1, 3, 7, 9, 1, 3 ,7, 9, 1, 3, 1].freeze

	def initialize (str1)
		@pesel =  str1.to_s
	end

	def validate	
		puts digits.size == 11 && control_value % 10 == 0
	end

	private	
	def digits
      @pesel.split("").select{|digit| digit.to_i.to_s == digit}.map(&:to_i)
    end
	 
	def control_value
      DIGIT_WEIGHTS.each_with_index.inject(0){|sum, (factor, idx)| sum + factor * digits[idx]}
    end

end

test_f = PeselValidator.new(44051401358)
test_t = PeselValidator.new(44051401359)
test_f.validate
test_t.validate