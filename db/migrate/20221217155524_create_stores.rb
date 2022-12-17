class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :type
      t.string :location
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
