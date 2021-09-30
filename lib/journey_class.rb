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

end