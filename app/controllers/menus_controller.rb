class MenusController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_store

  def create
    menu = @store.menus.create!(menu_params)
    render json: { data: { menu: menu } }, status: :ok
  end

  def index
    render json: { data: { menus: @store.menus } }, status: :ok
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def menu_params
    params.require(:menu).permit(:version)
  end
end
