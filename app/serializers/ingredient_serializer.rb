class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :name, :amount
end
