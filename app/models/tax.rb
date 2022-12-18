# == Schema Information
#
# Table name: taxes
#
#  id         :bigint           not null, primary key
#  name       :string
#  type       :integer
#  rate       :float
#  item_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tax < ApplicationRecord
  belongs_to :item
end
