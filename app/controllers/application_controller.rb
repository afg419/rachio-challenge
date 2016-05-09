class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user_dom

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_users_rachio_api_service
    RachioApiService.new(current_user) if current_user
  end

  def current_user_dom
    if current_user
      name = current_user.username
      {
        user: {username: name},
        message: "Logged in as #{name}",
        legal_api_key: current_users_rachio_api_service.legal_api_key?
      }
    else
      {}
    end
  end
end
