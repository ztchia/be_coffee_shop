class CustomersController < ApplicationController
  before_action :authenticate_user!, :set_customer, only: [:show, :update]

  def create
    customer = current_user.build_customer(customer_params)
    if customer.persisted?
      render json: { data: { customer: customer } }, status: :ok
    else
      render json: { status: 422, error: 'Unprocessable Entity' }, status: :unprocessable_entity
    end
  end

  def show
    render json: { data: { customer: @customer } }, status: :ok
  end

  def update
    @customer.update!(customer_params)
    render json: { data: { customer: @customer } }, status: :ok
  end

  private

  def set_customer
    @customer = current_user.customer
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :contact, :address)
  end
end
