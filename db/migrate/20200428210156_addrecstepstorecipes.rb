class Addrecstepstorecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :rec_steps, :string
  end
end
