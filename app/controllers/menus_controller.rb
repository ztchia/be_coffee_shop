class MenusController < ApplicationController
  before_action :authenticate_user!, except: :show

  def create
    @store = Store.find(store_params[:id])
    menu = @store.menus.create!(menu_params)
    render json: { data: { menu: menu } }, status: :ok
  end

  def index
    menus = Menu.all
    render json: { data: { menus: menus } }, status: :ok
  end

  private

  def store_params
    params.require(:store).permit(:id)
  end

  def menu_params
    params.require(:menu).permit(:version)
  end
end
