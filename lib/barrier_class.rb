class Barrier 
    def initialize
        @journey = false
    end    

    def sign_in
        @journey = true
        return
    end     

    def sign_out
        @journey = false
        return
    end  

    def in_journey?
        @journey 
    end     
    
    

    
    
end     