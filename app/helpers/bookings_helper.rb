module BookingsHelper
	def validParamId?(id)
		return false unless id.is_a?(String)
    id.match?(/\A[1-9]\d*\z/)
	end
end
