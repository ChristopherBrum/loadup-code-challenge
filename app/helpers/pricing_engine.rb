module PricingEngine
  BASE_CHARGE = 20
  PRICE_PER_HOUR = {
    "Cat" => 5,
    "Dog" => 10,
  }
  
  def calculate_price(type, hours)
    type = type.to_s.capitalize
    hours = hours.to_i

    unless PRICE_PER_HOUR.key?(type)
      raise ArgumentError, "Invalid animal type: #{type}"
    end

    unless hours.between?(2, 8)
      raise ArgumentError, "Invalid number of hours: #{hours}"
    end

    hourly_rate = PRICE_PER_HOUR[type]
    total_price = BASE_CHARGE + (hourly_rate * hours)

    total_price
  end
end