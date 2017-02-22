require 'journey'

describe Journey do
  subject(:journey) { described_class.new}
  let(:journey_record){{ entry:'entry', exit: 'exit'}}
    
    # it 'validates journey has a card' do
    #   expect(journe).not_to be_in_journey
    # end
    it 'should confirm it has empty list of journey' do
      expect(journey.journey_list).to eq []
    end
    it 'confirm touch_in & touch_out creates journey' do
      
      expect(journey_record).to eq({ entry:'entry', exit: 'exit'})
    end
end
