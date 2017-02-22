require 'journey'

describe Journey do
  subject(:journey) { described_class.new}
    it 'validates journey has a card' do
      expect(journey.card).not_to be_in_journey
    end
    it 'should confirm it has empty list of journey' do
      expect(card.list_of_journey).to eq []
    end
    it 'confirm touch_in & touch_out creates journey' do
      card.touch_in?('entry')
      card.touch_out?('exit')
      expect(card.list_of_journey).to eq([{ entry:'entry', exit: 'exit'}])
    end
end
