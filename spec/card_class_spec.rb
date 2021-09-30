require 'card_class'
require 'station_class'


RSpec.describe Card do
    # before(:each) do
    #     @my_oystercard_a = Card.new(10)
    #     @my_oystercard_b = Card.new(0)
    # end
    let(:my_oystercard) { Card.new(10) }
    let(:new_station) { Station.new("Manchester",1) }
    let(:station) {double :station}
    

       
    it "has a starting balance" do
        expect(my_oystercard.balance). to eq (10)
    end

    it "can be topped up" do
        expect(my_oystercard.top_up(10)). to eq (20)
    end

    it "throw error if limit of £90 is exceeded" do
        expect(my_oystercard.top_up(85)). to eq "error-balance cannot exceed £90"
    end

    it "deduct payment from my balance" do

        expect(my_oystercard.send(:deduct, 5)). to eq (5) # @my_oystercard_a.send(:deduct, 5) to override a private method
    end

    it " will raise an error when balance is below minimum balance" do
        minimum_balance = 1
        my_oystercard.balance = 0

        expect {my_oystercard.touch_in(station)}.to raise_error "card balance is below minimum balance of £#{minimum_balance} to touch in"
    end 
    
    it "touch in when a card has balance >= 1" do
        my_oystercard.touch_in(station)
    
        expect(my_oystercard).to be_in_journey
    end



    it "touch in card on the barrier" do
        my_oystercard.touch_in(station)
        expect(my_oystercard).to be_in_journey
    end

    it "touch out card on the barrier" do
        my_oystercard.touch_in(station)
        my_oystercard.touch_out(station)
        expect(my_oystercard).not_to be_in_journey
    end

    it "deduct the minimum fair on touch out" do 
        expect {my_oystercard.touch_out(station)}.to change{my_oystercard.balance}.by(-1)
    end  
    
    it "need to know station signed in from" do
        my_oystercard.touch_in(station)
        
        expect(my_oystercard.entry_station).to eq station
    
    end     

    it "set station on card to nil" do
    
        my_oystercard.touch_in(station)
        my_oystercard.touch_out(station)
        
        expect(my_oystercard.entry_station).to eq nil
    
    end 


    it "should see my previous trips" do
        my_oystercard.touch_in('Manchester')
        my_oystercard.touch_out("Liverpool")

        expect(my_oystercard.list_of_journeys).to eq [{"entry_station"=>"Manchester"}, {"exit_station"=>"Liverpool"}]
       
    end  
    
    it "what zone a station is in" do 
        
        expect(new_station.zone).to eq 1

    end     


   
end