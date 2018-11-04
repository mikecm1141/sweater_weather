class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location

  belongs_to :user
end
