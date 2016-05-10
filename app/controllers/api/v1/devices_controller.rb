class Api::V1::DevicesController < ApplicationController
  def update
    ras = current_users_rachio_api_service
    data = formatted_for_rachio_api(params["zones"])
    res = ras.put("/zone/start_multiple", data)
    if !res
      response.status = 204
    else
      response.status = 400
    end
    render json: "ok"
  end

private

  def formatted_for_rachio_api(data)
    "{ 'zones': " + data.values.reduce("[") do |acc, zone|
      acc + "{'id':'#{zone["id"]}', 'duration': #{zone["duration"]}, 'sortOrder': #{zone["sortOrder"]}}, "
    end[0..-3]+ "]}"
  end
end
