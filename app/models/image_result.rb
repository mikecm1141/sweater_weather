class ImageResult
  include ResultBuilder

  def initialize(location)
    @location = location.split(',')
  end

  def random_image_url
    random_image[:url_o]
  end

  private

  def flickr_service
    FlickrService.new
  end

  def location_images
    flickr_service.location_images(coordinates[:lat], coordinates[:lng])
  end

  def images_with_urls
    location_images[:photo].delete_if do |photo|
      photo[:url_o].nil?
    end
  end

  def random_image
    images_with_urls.sample
  end
end
