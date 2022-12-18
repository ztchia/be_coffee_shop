class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :contact
      t.text :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
