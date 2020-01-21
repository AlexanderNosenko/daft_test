class UserSerializer < BaseSerializer

  attributes :id,
:name,
:email,
:reset_password_token,
:date_of_birth,
:created_at,
:updated_at

end
