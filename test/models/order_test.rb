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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
