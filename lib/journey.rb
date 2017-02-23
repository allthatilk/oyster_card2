
class Journey
MINIMUM_FARE = 1

  attr_accessor :entry_station, :exit_station, :journey_list

    def initialize
      @journey_list = []#
      @entry_station, @exit_station  =  nil
    end

    def status?
      !!@entry_station
    end

    def journey_record#
      journey_list << {entry: @entry_station, exit: @exit_station}#
    end#

    def fare
      MINIMUM_FARE
    end



end #journey class
