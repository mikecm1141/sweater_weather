class FailedRegistrationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :errors
  
end
