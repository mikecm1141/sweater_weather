class NewUserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :api_key
end
