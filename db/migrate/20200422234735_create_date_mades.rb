class CreateDateMades < ActiveRecord::Migration[6.0]
  def change
    create_table :date_mades do |t|
      t.integer :recipe_id

      t.timestamps
    end
  end
end
