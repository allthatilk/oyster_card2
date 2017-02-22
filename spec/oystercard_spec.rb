require 'oyster_card'
describe OysterCard do
 let(:balance) { 0 }
 subject(:card) { described_class.new(balance) }
 min_amount = OysterCard::MINIMUM_AMOUNT
 max_amount = OysterCard::MAXIMUM_BALANCE


	describe "attributes of OysterCard" do
     it "should check the balance" do
     	expect(card.balance).to eq(0)
     end
	end

	describe "top_up of OysterCard" do
		it{is_expected.to respond_to(:top_up).with(1).argument}

    context "balance max error" do
      let(:balance) { max_amount }
  		it 'should raise error if balance>90' do
  			error = "Card Limit exceeded"
  			expect{ card.top_up(min_amount) }.to raise_error error
  		end
    end

		it "should top up the balance" do
			expect{ card.top_up(min_amount) }.to change{ card.balance }.by min_amount
		end
	end 	#top_up of oyster card


	describe 'in_journey' do
		let(:balance){ max_amount }

		context 'checking with 0 balance' do
		let(:balance){ 0 }
			it "validates that card has the min_amout for journey" do
				error = "Card doesn't have sufficiant money"
				expect{card.touch_in?}.to raise_error error
			end
		end	#context

  	it 'validates card was not in journey' do
  		expect(card).not_to be_in_journey
  	end

		it 'validates that card is deducted on touch out' do
			card.touch_in?
			expect{card.touch_out?}.to change{card.balance}.by(-min_amount)
		end
	end		#in_journey


	describe 'station' do
		let(:entry_station) { :aldgate_east }
		let(:exit_station) { :exit_station }
		let(:balance){ min_amount }
		it 'confirms card has an entry station on touch_in' do
			expect(card.touch_in?(:entry_station)).to eq :entry_station
		end
		it 'confirms card has an exit station when touch_out' do
			card.touch_in?(:entry_station)
			expect(card.touch_out?(:ex_st)).to eq :ex_st
		end
	end		#station
end		#OysterCard
