class CreateTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
      t.integer :kind
      t.float :rate, null: false

      t.timestamps
    end
  end
end
