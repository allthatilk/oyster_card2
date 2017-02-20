require 'oyster_card'
describe OysterCard do
 subject(:card){described_class.new}	

	describe "attributes" do
     it "should check the balance" do
     	expect(card.balance).to eq(0)
     end
	end 
end