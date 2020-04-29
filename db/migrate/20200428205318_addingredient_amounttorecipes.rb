class AddingredientAmounttorecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ingredient_amount, :string
  end
end
