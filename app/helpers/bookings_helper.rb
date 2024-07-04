module BookingsHelper
	def validParamId?(id)
		id.to_i.to_s == id && id.to_i > 0
	end
end
