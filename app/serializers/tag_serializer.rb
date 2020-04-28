class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe_id, :recipes

  def recipe 
    {recipe_id: self.object.recipe.id, 
    recipe_title: self.object.recipe.title}
  end

end
