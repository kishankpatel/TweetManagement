class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :remember_token
end
