class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :friend
end
