class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def create
    Order.in_progress.each do |order|
      order.notifications.create!(message: "User has been notified for Order##{order.id}",sent: false, customer_id: order.customer_id)
      order.ready!
    end

    render json: { data: { notification: "Notification created for in progress Order" } }, status: :ok
  end
end
