class Store < ApplicationRecord
  has_many :menus, dependent: :destroy
  validates :name, :kind, :location, presence: true
  validates :name, uniqueness: { scope: %i[location kind] }

  enum kind: { coffee_shop: 0 }
end
