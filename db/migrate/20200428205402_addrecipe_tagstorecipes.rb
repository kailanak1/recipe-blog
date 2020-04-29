class AddrecipeTagstorecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :rec_tag, :string
  end
end
