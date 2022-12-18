class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: :create
  def create
    category = @menu.categories.create!(category_param)

    render json: { data: { category: category } }, status: :ok
  end

  def index
    render json: { data: { categories: @menu.categories } }, status: :ok
  end

  private

  def category_param
    params.require(:menu).permit(:id)
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
end
