
class Card < Barrier

    attr_reader :balance
    TOP_UP_LIMIT = 90
    MINIMUM_BALANCE = 1
    

    def initialize(starting_balance)
        @balance = starting_balance
        
    end

       

    def top_up (top_up_amount)
        new_balance = @balance += top_up_amount
        if new_balance <TOP_UP_LIMIT
            return @balance
            
        elsif new_balance >TOP_UP_LIMIT
            return "error-balance cannot exceed £#{TOP_UP_LIMIT}"
            
        end

    end

    def touch_into_barrier
        if balance < MINIMUM_BALANCE
            touch_out
            return in_journey?
        elsif balance >= MINIMUM_BALANCE
            touch_in
            return in_journey?  
        end   
        

    end    



    def deduct(payment_amount)
        @balance -= payment_amount
    end  
    
        



        




end