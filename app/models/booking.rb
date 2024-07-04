class Booking < ApplicationRecord
	class Booking < ApplicationRecord
		validates :first_name, :last_name, :animal_name, :animal_type, presence: true
		validates :hours_requested, presence: true, numericality: { greater_than_or_equal_to: 2 }
		validates :date_of_service, presence: true
		validates :price, presence: true, numericality: { greater_than: 0 }
	end	
end
