class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :category, :main_pic, :user_id, :likes, :version
end
