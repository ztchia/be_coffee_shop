class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, :set_customer, only: :create
  
  def create
    payment = @order.payments.create!(payment_params)
    render json: { data: { payment: payment } }, status: :ok
  end

  def show
    render json: { data: { payment: Payment.find(params[:id]) } }, status: :ok
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def set_customer
    @customer = current_user.customer
  end

  def payment_params
    params.require(:payment).permit(:amount, :currency).merge(customer_id: @customer.id)
  end
end
