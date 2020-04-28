class StepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :step_summary, :recipe

  def recipe 
    puts "in steps serializer"
    {recipe_id: self.object.recipe.id, 
    recipe_title: self.object.recipe.title}
  end
end
