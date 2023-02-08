class Api::V1::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
    end
  
    def respond_with(resource, _opts = {})
      render json: resource
    end
end