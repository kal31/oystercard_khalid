require 'station_class'

RSpec.describe Station do
    
    let(:new_station) { Station.new("Manchester",1) }

    it "what zone a station is in" do 
        
        expect(new_station.zone).to eq 1

    end  
    
end