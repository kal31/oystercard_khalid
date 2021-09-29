
class Card 

    attr_reader :balance , :MINIMUM_BALANCE 
    TOP_UP_LIMIT = 90
    

    def initialize(starting_balance)
        @balance = starting_balance
        @in_journey = false
        @MINIMUM_BALANCE = 1 
        
    end

       

    def top_up (top_up_amount)
        new_balance = @balance += top_up_amount
        if new_balance <TOP_UP_LIMIT
            return @balance
            
        elsif new_balance >TOP_UP_LIMIT
            return "error-balance cannot exceed £#{TOP_UP_LIMIT}"
            
        end

    end

    def touch_in
        raise "card balance is below minimum balance of £#{@MINIMUM_BALANCE} to touch in" unless balance >= @MINIMUM_BALANCE
        @in_journey = true
        return in_journey?     
        # if balance < MINIMUM_BALANCE
        #     @in_journey = false
        #     return in_journey?
        # elsif balance >= MINIMUM_BALANCE
        #     @in_journey = true
        #     return in_journey?  
        # end   
    
    end    



    def deduct(payment_amount)
        @balance -= payment_amount
    end  

    

    def touch_out
        @in_journey = false
        return
    end  

    def in_journey?
        @in_journey 
    end     
    
    
        



        




end