require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "Validations" do
    it "is valid with all required attributes" do
      booking = Booking.new(
        first_name: "John",
        last_name: "Doe",
        animal_name: "Fluffy",
        animal_type: "Dog",
        hours_requested: 3,
        date_of_service: DateTime.now + 1.day,
        price: 30
      )
      expect(booking).to be_valid
    end

    it "is not valid without a first name" do
      booking = Booking.new(first_name: nil)
      expect(booking).to_not be_valid
      expect(booking.errors[:first_name]).to include("can't be blank")
    end

    it "is not valid without a last name" do
      booking = Booking.new(last_name: nil)
      expect(booking).to_not be_valid
      expect(booking.errors[:last_name]).to include("can't be blank")
    end

    it "is not valid without an animal name" do
      booking = Booking.new(animal_name: nil)
      expect(booking).to_not be_valid
      expect(booking.errors[:animal_name]).to include("can't be blank")
    end

    it "is not valid without an animal type" do
      booking = Booking.new(animal_type: nil)
      expect(booking).to_not be_valid
      expect(booking.errors[:animal_type]).to include("can't be blank")
    end

    it "is not valid without hours requested" do
      booking = Booking.new(hours_requested: nil)
      expect(booking).to_not be_valid
      expect(booking.errors[:hours_requested]).to include("can't be blank")
    end

    it "is not valid without a date of service" do
      booking = Booking.new(date_of_service: nil)
      expect(booking).to_not be_valid
      expect(booking.errors[:date_of_service]).to include("can't be blank")
    end

    it "is not valid without a price" do
      booking = Booking.new(price: nil)
      expect(booking).to_not be_valid
      expect(booking.errors[:price]).to include("can't be blank")
    end
  end

  describe "Default values" do
    it "sets hours_requested to 2 by default" do
      booking = Booking.new
      expect(booking.hours_requested).to eq(2)
    end
  end

  describe "Attributes" do
    it "has the expected attributes" do
      attributes = [:first_name, :last_name, :animal_name, :animal_type, :hours_requested, :date_of_service, :price]
      attributes.each do |attr|
        expect(Booking.new).to respond_to(attr)
      end
    end
  end

  describe "Database operations" do
    it "can be created with valid attributes" do
      expect {
        Booking.create!(
          first_name: "Jane",
          last_name: "Doe",
          animal_name: "Whiskers",
          animal_type: "Cat",
          hours_requested: 2,
          date_of_service: DateTime.now + 1.day,
          price: 20
        )
      }.to change(Booking, :count).by(1)
    end

    it "can be read" do
      booking = Booking.create!(
        first_name: "Test",
        last_name: "User",
        animal_name: "Pet",
        animal_type: "Dog",
        date_of_service: DateTime.now + 1.day,
        price: 25
      )
      expect(Booking.find(booking.id)).to eq(booking)
    end

    it "can be updated" do
      booking = Booking.create!(
        first_name: "Old",
        last_name: "Name",
        animal_name: "Pet",
        animal_type: "Dog",
        date_of_service: DateTime.now + 1.day,
        price: 25
      )
      booking.update!(first_name: "New")
      expect(booking.reload.first_name).to eq("New")
    end

    it "can be deleted" do
      booking = Booking.create!(
        first_name: "To",
        last_name: "Delete",
        animal_name: "Pet",
        animal_type: "Dog",
        date_of_service: DateTime.now + 1.day,
        price: 25
      )
      expect {
        booking.destroy
      }.to change(Booking, :count).by(-1)
    end
  end
end
