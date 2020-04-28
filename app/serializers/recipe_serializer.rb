class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :category, :main_pic, :user_id, :likes, :version, :ingredients, :tags, :steps

 def ingredients 
  ActiveModel::SerializableResource.new(self.object.ingredients,  each_serializer: IngredientSerializer)
 end

 def tags 
  ActiveModel::SerializableResource.new(self.object.tags,  each_serializer: TagSerializer)
 end

#  def steps 
#   ActiveModel::SerializableResource.new(self.object.steps,  each_serializer: StepSerializer)
#  end
  
end
