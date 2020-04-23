class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.string :name
      t.string :amount

      t.timestamps
    end
  end
end
