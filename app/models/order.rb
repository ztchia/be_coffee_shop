# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  status      :integer          default("initial")
#  details     :jsonb
#  store_id    :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
class Order < ApplicationRecord
  belongs_to :store
  belongs_to :customer
  has_many :taxes
  has_many :payments
  before_create :add_tax_rates

  enum status: {
    order_received: 0,
    in_progress: 100,
    in_kitchen: 200,
    ready: 300,
    completed: 400
  }

  private
  
  def add_tax_rates
    self.tax_rates = {
      service_charge: Tax.service_charge.first.rate,
      gst: Tax.gst.first.rate
    }
  end
end
