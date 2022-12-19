# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  email      :string           not null
#  contact    :string
#  address    :text
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
  belongs_to :user
  has_many :notifications
  validates :name, :email, presence: true
end
