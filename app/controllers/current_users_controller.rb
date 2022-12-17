class CurrentUsersController < ApplicationController
  before_action :authenticate_user!
  def show
    render json: current_user, status: :ok
  end
end
