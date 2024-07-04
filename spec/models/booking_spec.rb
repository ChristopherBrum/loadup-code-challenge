require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "attributes" do
    it "has the expected attributes" do
      attributes = [:first_name, :last_name, :animal_name, :animal_type, :hours_requested, :date_of_service, :price]
      attributes.each do |attr|
        expect(Booking.new).to respond_to(attr)
      end
    end
  end

  describe "default values" do
    it "sets hours_requested to 2 by default" do
      booking = Booking.new
      expect(booking.hours_requested).to eq(2)
    end
  end

  describe "database constraints" do
    it "requires first_name to be present" do
      booking = Booking.new(first_name: nil)
      expect { booking.save(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "requires last_name to be present" do
      booking = Booking.new(last_name: nil)
      expect { booking.save(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "requires animal_name to be present" do
      booking = Booking.new(animal_name: nil)
      expect { booking.save(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "requires animal_type to be present" do
      booking = Booking.new(animal_type: nil)
      expect { booking.save(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "requires hours_requested to be present" do
      booking = Booking.new(hours_requested: nil)
      expect { booking.save(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "requires date_of_service to be present" do
      booking = Booking.new(date_of_service: nil)
      expect { booking.save(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "requires price to be present" do
      booking = Booking.new(price: nil)
      expect { booking.save(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe "Booking operations - " do
    it "entity can be created with valid attributes" do
      expect {
        Booking.create!(
          first_name: "John",
          last_name: "Doe",
          animal_name: "Fluffy",
          animal_type: "Dog",
          hours_requested: 3,
          date_of_service: DateTime.now,
          price: 50
        )
      }.to change(Booking, :count).by(1)
    end

    it "entity can be read" do
      booking = Booking.create!(
        first_name: "Jane",
        last_name: "Smith",
        animal_name: "Whiskers",
        animal_type: "Cat",
        hours_requested: 2,
        date_of_service: DateTime.now,
        price: 40
      )
      expect(Booking.find(booking.id)).to eq(booking)
    end

    it "entity can be updated" do
      booking = Booking.create!(
        first_name: "Bob",
        last_name: "Johnson",
        animal_name: "Rex",
        animal_type: "Dog",
        hours_requested: 4,
        date_of_service: DateTime.now,
        price: 60
      )
      booking.update!(first_name: "Robert")
      expect(booking.reload.first_name).to eq("Robert")
    end

    it "entity can be deleted" do
      booking = Booking.create!(
        first_name: "Alice",
        last_name: "Brown",
        animal_name: "Mittens",
        animal_type: "Cat",
        hours_requested: 3,
        date_of_service: DateTime.now,
        price: 45
      )
      expect { booking.destroy }.to change(Booking, :count).by(-1)
    end
  end
end
