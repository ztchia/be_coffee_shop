class OrdersController < ApplicationController
  before_action :authenticate_user!, :set_customer
  before_action :list_items_as_json, only: [:create, :update]

  def create
    store = Store.find(params[:store_id]).orders.create!(customer_id: @customer.id, details: @list_items)
    render json: { data: { store: store } }, status: :ok
  end

  def show
    render json: { data: { order: Order.find(params[:id]) } }, status: :ok
  end

  def update
    order = Order.find(params[:id])
    if order.order_received? 
      order.details = @list_items
      order.save!
      render json: { data: { order: order } }, status: :ok
    else
      render json: { status: 422, error: 'Unprocessable Entity', message: 'Order has been processed, unable to update' }, status: :unprocessable_entity
    end
  end

  private

  def set_customer
    @customer = current_user.customer
  end

  def order_params
    params.require(:order).permit(item_ids: [])
  end

  def list_items_as_json
    @list_items = Item.where(id: order_params[:item_ids]).as_json(only: [:id, :name, :price, :category])
  end
end
