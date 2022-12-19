# == Schema Information
#
# Table name: notifications
#
#  id          :bigint           not null, primary key
#  message     :string
#  sent        :boolean
#  order_id    :bigint           not null
#  customer_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
