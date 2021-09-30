
class Card 
    MINIMUM_BALANCE = 1

    attr_reader :balance, :minimum_balance
    TOP_UP_LIMIT = 90
    
    def initialize(starting_balance)
        @balance = starting_balance
        @minimum_balance = MINIMUM_BALANCE
        @journey = []
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
        raise "card balance is below minimum balance of £#{@minimum_balance} to touch in" unless balance >= @minimum_balance
        @entry_station = station
        @journey = {"entry_station" => @entry_station}
        @list_of_journeys.push(@journey)
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

    private

    def deduct(payment_amount)
        @balance -= payment_amount
    end

end