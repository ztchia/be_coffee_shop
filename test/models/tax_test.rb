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
require "test_helper"

class TaxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
