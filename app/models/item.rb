# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  cost       :float
#  price      :float            not null
#  profit     :float
#  category   :integer
#  menu_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
  has_many :taxes
  belongs_to :menu
  before_validation :calculate_profit
  validates :name, :price, :cost, :profit, :category, presence: true
  validates :name, :category, presence: true, uniqueness: { scope: :menu_id }
  enum category: {
         food: 100,
         beverage: 200,
         dessert: 300,
         set_meal: 400,
         free: 999
       }

  private

  def calculate_profit
    self.profit = self.price - self.cost
  end
end
