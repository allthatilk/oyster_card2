class OysterCard 
	MAXIMUM_BALANCE = 90
	attr_reader :balance
	def initialize(balance = 0)
		@balance = balance
	end
		def top_up(amount)
			 if limit_exceed(amount)  
			 	fail "Card Limit exceeded"
			 else
			 	@balance += amount
			 end
			 return @balance
		end 

		def limit_exceed(amount)
			@balance + amount > MAXIMUM_BALANCE

		end

end