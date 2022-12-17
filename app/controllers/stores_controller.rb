class StoresController < ApplicationController
  before_action :authenticate_user!
  def create
    store = Store.create!(store_params)
    render json: { data: { store: store } }, status: :ok
  end

  private

  def store_params
    params.require(:store).permit(:name, :location)
  end
end
