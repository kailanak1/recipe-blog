class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.string :step_summary

      t.timestamps
    end
  end
end
