require 'card_class'
require 'barrier_class'

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
    
    it "throws an error if a card with insufficient balance is signed in" do

        @my_oystercard_b.sign_in

        expect(@my_oystercard_b.in_journey?). to eq (false)
    end

   
end