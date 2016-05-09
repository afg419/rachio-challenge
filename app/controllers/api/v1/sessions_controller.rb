class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(username: params["user"]["username"])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      current_user.get_or_update_devices(current_users_rachio_api_service)
      render json: current_user_dom
    else
      response.status = 400
      render json: "No user with given username and password found"
    end
  end

  def destroy
    current_user.devices.destroy_all
    session[:user_id] = nil
    response.status = 204
    render json: ""
  end
end
