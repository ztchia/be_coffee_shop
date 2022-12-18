# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  kind       :integer          default("coffee_shop")
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Store < ApplicationRecord
  has_many :menus, dependent: :destroy
  validates :name, :kind, :location, presence: true
  validates :name, uniqueness: { scope: %i[location kind] }

  enum kind: { coffee_shop: 0 }
end
