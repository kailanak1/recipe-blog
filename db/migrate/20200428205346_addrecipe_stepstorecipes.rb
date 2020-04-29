class AddrecipeStepstorecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :rec_step, :string
  end
end
