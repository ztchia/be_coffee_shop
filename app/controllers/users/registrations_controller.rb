# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  # # GET /resource/sign_up
  # def new
  #   super
  # end

  # # POST /resource
  def create
    super
  end

  protected

  # # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:registration, keys: ["email", "password"])
  end

  private
  def respond_with(resouce, _opts = {})
    register_success && return if resource.persisted?
    register_failed
  end

  def register_success
    create_customer if user_params[:role] == 'customer'
    render json: {
      status: {code: 200, message: 'Signed up sucessfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }
  end

  def user_params
    params.require(:user).permit(:name, :email, :contact, :address, :role)
  end

  def create_customer
    customer = current_user.build_customer
    customer.name = user_params[:name]
    customer.email = user_params[:email]
    customer.contact = user_params[:contact]
    customer.address = user_params[:address]
    customer.save!
  end

  def register_failed
    render json: {
      status: {message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
    }, status: :unprocessable_entity
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
