class AddingredientNametorecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ingredient_name, :string
  end
end
