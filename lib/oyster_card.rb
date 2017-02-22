class OysterCard
	MINIMUM_AMOUNT = 1
	MAXIMUM_BALANCE = 90
	attr_reader :balance, :entry_station, :exit_station, :list_of_journey#
	def initialize(balance = 0)
		@balance = balance
		@list_of_journey = []#

	end

		def top_up(amount)
			fail "Card Limit exceeded" if @balance + amount > MAXIMUM_BALANCE
			@balance += amount

		end

		def in_journey?#
			!!@entry_station#
		end#

		def touch_in?(entry_station = nil)

			raise "Card doesn't have sufficiant money" if @balance < MINIMUM_AMOUNT
			@entry_station  = entry_station
		end
		def touch_out?(station=nil)
			deduct(MINIMUM_AMOUNT)
			@list_of_journey << {entry: @entry_station, exit: station }#
			@exit_station = station#
		end

	private

	def deduct(amount)
			@balance -= amount
		end
end 	#OysterCard
