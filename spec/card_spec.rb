require 'card'

RSpec.describe Card do
    before(:each) do
        @my_oystercard_a = Card.new(10)
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
    

   
end