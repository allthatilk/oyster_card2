require 'oyster_card'
describe OysterCard do
 let(:balance) {0}
 subject(:card){described_class.new(balance)}	


	describe "attributes of OysterCard" do
     it "should check the balance" do
     	expect(card.balance).to eq(0)
     end
	end 
	
	describe "top_up of OysterCard" do
		it{is_expected.to respond_to(:top_up).with(1).argument}

		it 'should raise error if balance>90' do
			error = "Card Limit exceeded"
			card.top_up(OysterCard::MAXIMUM_BALANCE)			
			expect{card.top_up(1)}.to raise_error error
		end 

		it "should top up the balance" do
			expect{card.top_up(OysterCard::MINIMUM_AMOUNT)}.to change{card.balance}.by OysterCard::MINIMUM_AMOUNT
		end 
	end 	#top_up of oyster card
	

	describe 'in_journey' do
		let(:balance){OysterCard::MAXIMUM_BALANCE}

		context 'checking with 0 balance' do
		let(:balance){0}
			it "validates that card has the min_amout for journey" do
				error = "Card doesn't have sufficiant money"
				expect{card.touch_in?}.to raise_error error 
			end
		end	#contex
		it 'validates card was not in journey' do			
			expect(card).not_to be_in_journey
		end
	
		it 'validates that card is deducted on touch out' do			
			card.touch_in?
			expect{card.touch_out?}.to change{card.balance}.by(-OysterCard::MINIMUM_AMOUNT)
		end

	end		#in_journey
	describe 'station' do
		let(:entry_station) { :aldgate_east }
		let(:ex_st) { double(:exit_station) }
		let(:balance){1}
		it 'confirms card has an entry station on touch_in' do			
			# card.top_up(OysterCard::MINIMUM_AMOUNT)
			card.touch_in?(:entry_station)
			expect(card.entry_station).to eq :entry_station
		end
		it 'confirms card has an exit station when touch_out' do
			card.touch_in?(:entry_station)
			card.touch_out?(:ex_st)		
			expect(card.exit_station).to eq :ex_st
		end

	end		#station
	describe 'trips record' do
		let(:balance){1}
		#let(:journey){ {} }
		it 'should confirm it has empty list of journey' do
			expect(card.list_of_journey).to eq []
		end
		it 'confirm touch_in & touch_out creates journey' do			
			card.touch_in?('entry')
			card.touch_out?('exit')
			expect(card.list_of_journey).to eq([{ entry:'entry', exit: 'exit'}])
		end
		
	
	end	# trips record
end		#OysterCard