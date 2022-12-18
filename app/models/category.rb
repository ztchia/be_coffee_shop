# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  kind       :integer          not null
#  menu_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  belongs_to :menu
  enum kind: {
         food: 100,
         beverage: 101,
         dessert: 102,
         set_meal: 103,
         free: 999
       }
end
