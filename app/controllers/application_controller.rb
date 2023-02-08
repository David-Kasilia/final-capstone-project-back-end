class ApplicationController < ActionController::API

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
          user_params.permit(:name, :email, :password, :password_confirmation, :role)
        end
    
        devise_parameter_sanitizer.permit(:sign_in) do |user_params|
          user_params.permit(:email, :password, :remember_me)
        end

        devise_parameter_sanitizer.permit(:account_update) do |user_params|
            user_params.permit(:email, :password, :remember_me)
        end
    end
end
