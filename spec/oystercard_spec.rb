require 'oyster_card'
describe OysterCard do
 subject(:card){described_class.new}	

	describe "attributes of oyster OysterCard" do
     it "should check the balance" do
     	expect(card.balance).to eq(0)
     end
	end 
	describe "top_up of OysterCard" do
		it{is_expected.to respond_to(:top_up).with(1).argument}

		it 'should raise error if balance>90' do
			error = "Card Limit exceeded"
			card.top_up(OysterCard::MAXIMUM_BALANCE)
			# p card.balance.to_s + "Balance"
			expect{card.top_up(1)}.to raise_error error
		end 

		it "should top up the balance" do
			expect{card.top_up(10)}.to change{card.balance}.by 10
		end 
	end 
	describe 'deductions from oyster card' do
		it {is_expected.to respond_to(:deduct).with(1).argument}
		 it 'should raise an error if balance is 0' do
		 	card.deduct(card.balance-1)
		 	error = "There is 0 balance on the card"
		 	expect{card.deduct(1)}.to raise_error error 
		 end
	end

	describe 'in_journey' do
		it {should respond_to(:in_journey?)}
		it {should respond_to(:touch_in?)}
		it {should respond_to(:touch_out?)}
		
		it "validates that card has the min_amout for journey" do
			error = "Card doesn't have sufficiant money"
			expect{card.touch_in?}.to raise_error error 
		end
		it 'validates card was not in journey' do
			card.touch_out?
			expect(card).not_to be_in_journey
		end
		it 'validates card is in journey' do
			card.top_up(OysterCard::MINIMUM_AMOUNT)
			card.touch_in?
			expect(card).to be_in_journey
		end
	end	
end