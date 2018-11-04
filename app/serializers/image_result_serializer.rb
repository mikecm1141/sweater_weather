class ImageResultSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location_string

  attributes :random_image
end
