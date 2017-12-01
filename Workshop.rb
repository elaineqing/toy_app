require 'rspec'

class Workshop

    attr_reader :bookings

    def new_booking(date, car)
        {
            '2017-11-30' => "Red Car",
            '2017-12-01' => "Blue Car"
        }
    end


    def addBookTime(booktime)
        if @bookings.include?(booktime)
            "Sorry this time has been booked already"
        else 
            @bookings.push(booktime)
        end

    end

end

RSpec.describe "Zoo" do

    let(:my_workshop) { Workshop.new }
    let(:booking_date) { '2017-11-30' }

    describe "when making a new booking" do
        
        it "accepts the booking in the right format" do
            expect(my_workshop.new_booking(booking_date, "Red Car")).to be_truthy
        end

    end



    it "could add booktime in" do
        expect(my_workshop.addBookTime("11.12.2017")).to include("11.12.2017")
    end

    it "will show time has been booked or not"do
        expect(my_workshop.addBookTime("12.12.2017")).to eq("Sorry this time has been booked already")
    end

end
