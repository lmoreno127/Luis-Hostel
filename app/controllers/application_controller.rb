class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :store_user_location!, if: :storable_location?
    protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:last_name])
   end
   def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end
   def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end
