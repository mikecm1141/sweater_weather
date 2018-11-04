module ResultBuilder
  def location_string
    "#{location_hash[:city].capitalize}, #{location_hash[:state].upcase}"
  end
  
  private

  def google_service
    GoogleService.new
  end

  def coordinates
    @coordinates ||= google_service.coordinates(location_hash[:city], location_hash[:state])[0][:geometry][:location]
  end

  def location_hash
    {
      city:  @location[0],
      state: @location[1]
    }
  end
end
