class Api::V1::ZonesController < ApplicationController
  def update
    ras = current_users_rachio_api_service
    data = "{'id': '#{params[:id]}', 'duration': #{params[:duration]}}"
    res = ras.put("/zone/start", data)
    if !res
      response.status = 204
    else
      response.status = 400
    end
    render json: "ok"
  end
end
