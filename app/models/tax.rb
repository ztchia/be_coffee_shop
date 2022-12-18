# == Schema Information
#
# Table name: taxes
#
#  id         :bigint           not null, primary key
#  name       :string
#  type       :integer
#  rate       :float            not null
#  order_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tax < ApplicationRecord
  validates :type, uniqueness: true
  enum kind: {
    sst: 100,
    gst: 200,
    service_charge: 800,
    tax_free: 900
  }
end
