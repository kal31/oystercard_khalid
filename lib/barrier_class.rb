

class Barrier 


    def initialize
        @journey = false
    end    

    def touch_in
         @journey = true
         return      
    end     

    def touch_out
        @journey = false
        return
    end  

    def in_journey?
        @journey 
    end     
    

    
end     