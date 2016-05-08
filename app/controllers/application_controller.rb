class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user_dom

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_dom
    if current_user
      name = current_user.username
      {user: {username: name}, message: "Logged in as #{name}"}
    else
      {}
    end
  end
end
