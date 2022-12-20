class Combo < ApplicationRecord
  has_many :combo_items, dependent: :destroy
  has_many :items, through: :combo_items
end
