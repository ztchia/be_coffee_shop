# == Schema Information
#
# Table name: payments
#
#  id          :bigint           not null, primary key
#  amount      :float
#  currency    :string           default("USD")
#  status      :integer          default(0)
#  order_id    :bigint           not null
#  customer_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :customer
  before_validation :update_amount_with_taxes
  after_create :update_order_status

  enum status: [:paid]

  private

  def update_amount_with_taxes
    tax_rates = Order.find(self.order_id).tax_rates
    total_payable = tax_rates.values.map do |tax_rate| 
      amount * (tax_rate/100)
    end
    total_payable << amount
    self.amount = total_payable.sum
  end

  def update_order_status
    Order.find(self.order_id).in_progress!
  end
end
