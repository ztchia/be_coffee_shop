class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :kind, default: 0
      t.string :location

      t.timestamps
    end
  end
end
