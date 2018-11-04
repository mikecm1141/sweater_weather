class ImageResult
  include ResultBuilder

  def initialize(location)
    @location = location.split(',')
  end

  def random_image
    "random_image_url.jpg"
  end
end
