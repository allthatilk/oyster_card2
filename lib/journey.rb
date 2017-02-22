# require_relative 'oyster_card'
#
# class Journey
#   attr_reader :list_of_journey, :card
#
#   def initialize(card)
#     @card = card
#     @list_of_journey = []
#   end
#
#   	@exit_station = station
#
#   def in_journey?
#     !!@entry_station
#   end
#
#   def record
#     @list_of_journey << {entry: @entry_station, exit: station }
#   end
#
# end
require 'oyster_card'
card = OysterCard.new
class Journey
attr_reader :journey_list
  def initialize
    @journey_record = []
  end

  def starting_point
    @start = card.entry_station
  end

  def finishing_point
    @finish = card.exit_station
  end

  def calculate_fare

  end

  def in_journey?
    !!@start
  end

  def journey_record
    journey_record << {starting_point, finishing_point}
  end
end
