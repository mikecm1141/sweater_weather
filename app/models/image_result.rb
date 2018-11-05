class ImageResult
  include ResultBuilder

  def initialize(location)
    @location = location.split(',')
  end

  def random_image_url
    flickr_service.location_images(coordinates[:lat], coordinates[:lng])
  end

  private

  def flickr_service
    FlickrService.new
  end
end
