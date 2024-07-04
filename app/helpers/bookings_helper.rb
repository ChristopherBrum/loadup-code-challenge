module BookingsHelper
	BASE_CHARGE = 20
	PRICE_PER_HOUR = {
		"Cat" => 5,
		"Dog" => 10,
	}
	
	def calculatePrice(type, hours)
		type = params["booking"]["animal_type"]
	 	hours = params["booking"]["hours_requested"].to_i
		
		BASE_CHARGE + (PRICE_PER_HOUR[type] * hours)
	end
end
