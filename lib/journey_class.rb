require 'card_class'

class Journey

    attr_accessor :entry_station , :list_of_journeys


    def initialize
        @list_of_journeys = []
        @journey = nil
        @entry_station = nil
    end
        
    def in_journey?
        if @entry_station != nil
            true 
        else
            false  
        end
    end

    def touch_in(station)
        @entry_station = station
        @journey = {"entry_station" => @entry_station}
        @list_of_journeys.push(@journey)
        raise "card balance is below minimum balance of £#{@MINIMUM_BALANCE} to touch in" unless balance >= @MINIMUM_BALANCE
        return @entry_station
    end    

    def touch_out(exit_station)
        @exit_station = exit_station
        @journey = {"exit_station" => @exit_station}
        @list_of_journeys.push(@journey)
        @entry_station = nil
        deduct(@MINIMUM_BALANCE)
        return @exit_station
    end  

end