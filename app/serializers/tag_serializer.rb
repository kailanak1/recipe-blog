class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe_id
end
