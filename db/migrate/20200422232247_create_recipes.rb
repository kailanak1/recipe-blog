class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :summary
      t.string :category
      t.string :main_pic
      t.integer :user_id
      t.integer :likes
      t.string :version

      t.timestamps
    end
  end
end
