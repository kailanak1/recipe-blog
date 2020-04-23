class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :summary
      t.string :category
      t.string :main_pic
      t.string :user_id
      t.string :likes
      t.string :version

      t.timestamps
    end
  end
end
