class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :favorites, :email
end
