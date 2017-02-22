class OysterCard 
	MINIMUM_AMOUNT = 1
	MAXIMUM_BALANCE = 90
	attr_reader :balance, :entry_station, :exit_station
	# attr_accessor :touch_in, :touch_out
	def initialize(balance = 0)
		@balance = balance
		@touch_in = false
		@touch_out = false

	end
		def top_up(amount)
			 if max_balance_limit(amount)  
			 	fail "Card Limit exceeded"
			 else
			 	@balance += amount
			 end
		@balance
		end 

		def in_journey?	
			!!@entry_station		
			# @touch_in
		end
		def touch_in?(entry_station = nil)
			if sufficiant_amount?
					@entry_station  = entry_station 					
					@touch_out = false
					return @touch_in = true
				
			else
				raise "Card doesn't have sufficiant money"
			end
		end
		def touch_out?(station=nil)					
			deduct(MINIMUM_AMOUNT)
			@touch_in = false
			@entry_station = nil
			@exit_station = station
			@touch_out = true
		end
		
	private

	def max_balance_limit(amount)
			@balance + amount > MAXIMUM_BALANCE
		end
	
	def min_balance_limit(amount)
		@balance - amount <= 0
	end
	def sufficiant_amount?
		@balance >= MINIMUM_AMOUNT
	end

	def deduct(amount)			
		# if  min_balance_limit(amount) 
		if @balance - amount < 0
			fail "There is 0 balance on the card" 
		else
			@balance -= amount
		end
		@balance
		end
end