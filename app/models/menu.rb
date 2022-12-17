class Menu < ApplicationRecord
  belongs_to :store
  validates :version, presence: true, uniqueness: { scope: :store_id }
end
