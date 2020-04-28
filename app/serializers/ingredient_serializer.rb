class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :name, :amount, :recipe

  def recipe 
    {recipe_id: self.object.recipe.id, 
    recipe_title: self.object.recipe.title}
  end
end
