require 'card_class'
require 'journey_class'

RSpec.describe Card do
    let(:my_oystercard) { Card.new(10) }
    let(:station) {double :station}
     
    describe '#balance' do
        it "has a starting balance" do
            expect(my_oystercard.balance). to eq (10)
        end
    end

    describe '#top_up' do
        it "can be topped up" do
            expect(my_oystercard.top_up(10)). to eq (20)
        end
    
        it "throw error if limit of £90 is exceeded" do
            expect(my_oystercard.top_up(85)). to eq "error-balance cannot exceed £90"
        end
    end

    describe '#touch_in' do
        it " will raise an error when balance is below minimum balance" do
            my_oystercard = Card.new(0)
            expect {my_oystercard.touch_in(station)}.to raise_error "card balance is below minimum balance of £1 to touch in"
        end 

        it "touch in when a card has balance >= 1" do
            my_oystercard.touch_in(station)
            expect(my_oystercard).to be_in_journey
        end

        it "sets card on journey" do
            my_oystercard.touch_in(station)
            expect(my_oystercard).to be_in_journey
        end

        it "sets entry station" do
            my_oystercard.touch_in(station)
            expect(my_oystercard.entry_station).to eq station
        end  
    end
   
    describe '#touch_out' do
        it "sets card not on journey" do
            my_oystercard.touch_in(station)
            my_oystercard.touch_out(station)
            expect(my_oystercard).not_to be_in_journey
        end
    
        it "deduct the minimum fair on touch out" do 
            expect {my_oystercard.touch_out(station)}.to change{my_oystercard.balance}.by(-1)
        end  
        
        it "set station on card to nil" do
            my_oystercard.touch_in(station)
            my_oystercard.touch_out(station)
            expect(my_oystercard.entry_station).to eq nil
        end 
    end 

    describe '#list_of_journeys' do
        it "should see my previous trips" do
            my_oystercard.touch_in('Manchester')
            my_oystercard.touch_out("Liverpool")
            expect(my_oystercard.list_of_journeys).to eq [{"entry_station"=>"Manchester"}, {"exit_station"=>"Liverpool"}]
        end   
    end
 
end