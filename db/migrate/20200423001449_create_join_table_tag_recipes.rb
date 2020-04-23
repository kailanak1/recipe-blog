class CreateJoinTableTagRecipes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tags, :recipes do |t|
      # t.index [:tag_id, :recipe_id]
      # t.index [:recipe_id, :tag_id]
    end
  end
end
