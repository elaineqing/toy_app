require 'rspec'

class Zoo

    def welcome_message
        "Hello, would you like to see a #{todays_animal} today?"
    end

    def animals
        ["Fox", "Rabbits", "Lion", "Elephant", "Otter","Unicoin"]
    end

    def todays_animal
        animals.sample
    end

    def has_animal?(search)
        @seach_animal = search
        if animals.include?(@seach_animal)
            true
        else "Sorry we don't have a #{@seach_animal}"
        end
    end
end

RSpec.describe "Zoo" do

    let(:my_zoo) { Zoo.new }

    it "has 5 animals" do
        expect(my_zoo.animals.size).to eq(6)
    end

    it "has a Lion" do
        expect(my_zoo.animals).to include("Lion")
    end

    it "has no Ruby" do
        expect(my_zoo.animals).to_not include("Ruby")
    end

    it "has a nice welcome message" do
        allow(my_zoo).to receive(:todays_animal).and_return("Tiger")
        expect(my_zoo.welcome_message).to eq("Hello, would you like to see a Tiger today?")
    end

    it "has a Elephant in it" do
        expect(my_zoo.has_animal?("Elephant")).to eq(true)
    end

    it "sorry message" do
        expect(my_zoo.has_animal?("Potato")).to eq("Sorry we don't have a Potato")
    end

end
