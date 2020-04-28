class RemoveStepsFromRecipe < ActiveRecord::Migration[6.0]
  def change

    remove_column :recipes, :steps, :string
  end
end
