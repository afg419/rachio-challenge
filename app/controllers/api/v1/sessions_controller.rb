class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(username: params["user"]["username"])
    if user && user.authenticate(params[:user][:password])
      ras = RachioApiService.new(user)
      session[:user_id] = user.id
      render json: {user: {username: user.username}}
    else
      response.status = 400
      render json: "No user with given username and password found"
    end
  end

  def destroy
    session[:user_id] = nil
    response.status = 204
    render json: ""
  end
end
