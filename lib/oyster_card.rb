class OysterCard 
	MAXIMUM_BALANCE = 90
	attr_reader :balance
	def initialize(balance = 0)
		@balance = balance
	end
		def top_up(amount)
			 if max_balance_limit(amount)  
			 	fail "Card Limit exceeded"
			 else
			 	@balance += amount
			 end
			 return @balance
		end 
		def deduct(amount)
			
			if  min_balance_limit(amount) 
				fail "There is 0 balance on the card" 
			else
				@balance -= amount
			end
		end

		def max_balance_limit(amount)
			@balance + amount > MAXIMUM_BALANCE
		end
		def min_balance_limit(amount)
			@balance - amount <= 0
		end

end