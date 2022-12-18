class StoresController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    store = Store.create!(store_params)
    render json: { data: { store: store } }, status: :ok
  end

  def index
    stores = Store.all
    render json: { data: { stores: stores } }, status: :ok
  end

  private

  def store_params
    params.require(:store).permit(:name, :location)
  end
end
