class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :cost
      t.float :price, null: false
      t.float :profit
      t.integer :category
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
