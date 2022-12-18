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
require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
