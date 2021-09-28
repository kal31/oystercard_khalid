require 'card_class'
MINIMUM_BALANCE = 1
class Barrier 
    def initialize
        @journey = false
    end    

    def sign_in
        if @balance >= MINIMUM_BALANCE
           @journey = true
        else 
            @journey = false
          return
        end 
    end     

    def sign_out
        @journey = false
        return
    end  

    def in_journey?
        @journey 
    end     
    
    

    
    
end     