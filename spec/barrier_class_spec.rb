require 'barrier_class'

RSpec.describe Barrier do
    before(:each) do
        @barrier_test = Barrier.new
    end

    it "touch in card on the barrier" do
        @barrier_test.touch_in
        expect(@barrier_test.in_journey?). to eq (true)
    end

    it "touch out card on the barrier" do
        @barrier_test.touch_out
        expect(@barrier_test.in_journey?). to eq (false)
    end

end  