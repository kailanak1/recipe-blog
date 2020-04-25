class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :favorites, :email
  # accepts_nested_attributes_for :recipes
end
