
class Card 

    attr_accessor :balance , :MINIMUM_BALANCE , :entry_station , :list_of_journeys
    TOP_UP_LIMIT = 90
    

    def initialize(starting_balance)
        @balance = starting_balance
        @MINIMUM_BALANCE = 1 
        @entry_station = nil
        @list_of_journeys = []
        @journey = nil
        
    end

       

    def top_up (top_up_amount)
        new_balance = @balance += top_up_amount
        if new_balance <TOP_UP_LIMIT
            return @balance
            
        elsif new_balance >TOP_UP_LIMIT
            return "error-balance cannot exceed £#{TOP_UP_LIMIT}"
            
        end

    end

    def touch_in(station)
        @entry_station = station
        @journey = {"entry_station" => @entry_station}
        @list_of_journeys.push(@journey)
        raise "card balance is below minimum balance of £#{@MINIMUM_BALANCE} to touch in" unless balance >= @MINIMUM_BALANCE
        return @entry_station
        
    
    end    



    def deduct(payment_amount)
        @balance -= payment_amount
    end 
    private :deduct 

    

    def touch_out(exit_station)
        @exit_station = exit_station
        @journey = {"exit_station" => @exit_station}
        @list_of_journeys.push(@journey)
        @entry_station = nil
        deduct(@MINIMUM_BALANCE)
        return @exit_station
    end  

    def in_journey?
        if @entry_station != nil
            true 
        else
            false  
        end        
    end  
    
    
    
        



        




end