# == Schema Information
#
# Table name: menus
#
#  id         :bigint           not null, primary key
#  version    :string           not null
#  store_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Menu < ApplicationRecord
  belongs_to :store
  has_many :items
  validates :version, presence: true, uniqueness: { scope: :store_id }
end
