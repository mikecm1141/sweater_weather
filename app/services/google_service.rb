class GoogleService
	def coordinates(city, state)
		conn = Faraday.new(url: 'https://maps.googleapis.com/')
		response = conn.get("/maps/api/geocode/json?address=Denver+CO&key=#{ENV['GOOGLE_API_KEY']}")
		JSON.parse(response.body, symbolize_names: true)[:results]
	end
end