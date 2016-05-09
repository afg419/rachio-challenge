require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  it "logs in a registered user" do
    VCR.use_cassette 'registered log in' do
      user_params = {user: {username: "user1", password: "password1", api_key: "1111"}}
      User.create(user_params[:user])

      post :create, user_params
      reply = JSON.parse(response.body)

      expect(reply["user"]["username"]).to eq "user1"
      expect(response.status).to eq 200
    end
  end

  it "returns error message if user not registered" do
    VCR.use_cassette 'unregistered log in' do
      user_params = {user: {username: "user1", password: "password1", api_key: "1111"}}

      post :create, user_params
      reply = response.body

      expect(reply).to eq "No user with given username and password found"
      expect(response.status).to eq 400
    end
  end
end
