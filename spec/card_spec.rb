require 'card'

describe Card do
    let( :card_test ) { Card.new }
    it "has zero balance" do
        expect(card_test.balance).to eq(0)
    end
    
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can be topped-up" do
        top_up_value = 7
        expect(card_test.top_up(top_up_value)).to eq(card_test.balance)
    end
end