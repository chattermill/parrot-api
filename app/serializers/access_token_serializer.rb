class AccessTokenSerializer < ActiveModel::Serializer
  attributes :access_token, :expires_in

  has_one :user
end
