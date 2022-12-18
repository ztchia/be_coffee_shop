class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_menu, only: [:create, :index]

  def create
    item = @menu.items.create!(item_params)
    render json: { data: { item: item } }, status: :ok
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    render json: { data: { item: item } }, status: :ok
  end

  def index
    render json: { data: { items: @menu&.items } }, status: :ok
  end

  private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def item_params
    params.require(:item).permit(:name, :cost, :price, :profit, :category)
  end
end
