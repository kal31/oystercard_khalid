require 'card_class'


RSpec.describe Card do
    before(:each) do
        @my_oystercard_a = Card.new(10)
        @my_oystercard_b = Card.new(0)
    end

       
    it "has a starting balance" do
        expect(@my_oystercard_a.balance). to eq (10)
    end

    it "can be topped up" do
        expect(@my_oystercard_a.top_up(10)). to eq (20)
    end

    it "throw error if limit of £90 is exceeded" do
        expect(@my_oystercard_a.top_up(85)). to eq "error-balance cannot exceed £90"
    end

    it "deduct payment from my balance" do
        
        expect(@my_oystercard_a.deduct(5)). to eq (5)
    end

    it " will raise an error when balance is below minimum balance" do
        minimum_balance = 1

        expect {@my_oystercard_b.touch_in}.to raise_error "card balance is below minimum balance of £#{minimum_balance} to touch in"
    end 
    # it "error when a card with insufficient balance is trying to touch in" do
    
    #     expect(@my_oystercard_b.touch_in). to eq (false)
    # end

    it "touch in when a card has balance >= 1" do
    
        expect(@my_oystercard_a.touch_in). to eq (true)
    end



    it "touch in card on the barrier" do
        @my_oystercard_a.touch_in
        expect(@my_oystercard_a.in_journey?). to eq (true)
    end

    it "touch out card on the barrier" do
        @my_oystercard_a.touch_out
        expect(@my_oystercard_a.in_journey?). to eq (false)
    end


   
end