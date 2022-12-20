class CreateCombos < ActiveRecord::Migration[7.0]
  def change
    create_table :combos do |t|
      t.string :name
      t.float :discount
      t.integer :discounted_item_id, null: false

      t.timestamps
    end
  end
end
