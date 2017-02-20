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

		it "should top up the balance" do
			expect(card.top_up(10)).to eq(card.balance)
		end 
	end 
end