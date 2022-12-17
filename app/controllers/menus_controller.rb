class MenusController < ApplicationController
  before_action :authenticate_user!, except: :show

  def create
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

  def menu_params
    params.require(:menu).permit(:version, :restaurant_id)
  end
end
