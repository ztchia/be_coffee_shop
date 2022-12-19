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
  belongs_to :menu
  before_validation :calculate_profit
  before_save :capitalize_name
  validates :name, :price, :cost, :profit, :category, presence: true
  validates :name, presence: true, uniqueness: { scope: :menu_id }
  validates :price, comparison: { equal_to: 0 }, if: :free?
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

  def capitalize_name
    self.name.capitalize!
  end
end
