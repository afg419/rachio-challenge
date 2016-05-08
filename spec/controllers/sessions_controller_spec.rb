require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  it "logs in a registered user" do
    user_params = {username: "user1", password: "password1", api_key: "1111"}
    User.create(user_params)

    post :create, user_params
    reply = JSON.parse(response.body)

    expect(reply["user"]["username"]).to eq "user11"
    expect(response.status).to eq 200
  end

  it "returns error message if user not registered" do
    user_params = {username: "user1", password: "password1", api_key: "1111"}

    post :create, user_params
    reply = JSON.parse(response.body)

    expect(reply["error"]).to eq "[\"No user with given username and password found\"]"
    expect(response.status).to eq 400
  end
end
