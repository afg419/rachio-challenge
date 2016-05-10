class RachioApiService
  attr_reader :api_key, :root_url, :user_rachio_id, :user

  def initialize(user)
    @user = user
    @api_key = user.api_key
    @root_url = "https://api.rach.io/1/public"
    @user_rachio_id = get_or_update_user_rachio_id
  end

  def get_or_update_user_rachio_id
    user.rachio_id = get("/person/info")["id"]
    user.save
    user.rachio_id
  end

  def get_user_devices
    get("/person/#{user_rachio_id}")["devices"]
  end

  def legal_api_key?
    user_rachio_id
  end

  def get(path)
    uri = URI(root_url + path)
    req = Net::HTTP::Get.new(uri, "Authorization" => "Bearer #{api_key}")
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") {|http|
      http.request(req)
    }
    JSON.parse(res.body)
  end

  #ras.put("/zone/start", '{"id": "61197df9-d256-4959-8117-7625f919b2b3", "duration": 60}')
  def put(path, data) #data = '{"id": "61197df9-d256-4959-8117-7625f919b2b3", "duration": 60}'
    uri = URI(root_url + path)
    req = Net::HTTP::Put.new(uri, "Authorization" => "Bearer #{api_key}")
    req.body = data
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") {|http|
      http.request(req)
    }
    res.body
  end
end

# u = User.first
# ras = RachioApiService.new(u)
# ras.put2("/zone/start", '{"id": "61197df9-d256-4959-8117-7625f919b2b3"}')



# h1 = {"id"=>"61197df9-d256-4959-8117-7625f919b2b3", "zoneNumber"=>6, "name"=>"Zone 6", "enabled"=>true, "customNozzle"=>{"name"=>"Rotor Head", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/nozzle/rotor_head.png", "category"=>"ROTOR_HEAD", "inchesPerHour"=>1.0}, "customSoil"=>{"createDate"=>1441831272323, "lastUpdateDate"=>1441831272323, "id"=>"1f9240e5-ba87-4b88-b828-a5f456f399b7", "name"=>"Loam", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/soil/loam.png", "category"=>"LOAM", "infiltrationRate"=>0.35, "editable"=>false, "percentAvailableWater"=>0.7}, "customSlope"=>{"name"=>"Flat", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/slope/flat.png", "variance"=>"ZERO_THREE", "sortOrder"=>0}, "customCrop"=>{"name"=>"Cool Season Grass", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/crop/cool_season_grass.png", "coefficient"=>0.7}, "customShade"=>{"name"=>"Lots of sun", "description"=>"6-8 hours of sun", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/shade/lots_of_sun.png", "exposure"=>1.0}, "availableWater"=>0.17, "rootZoneDepth"=>6.0, "managementAllowedDepletion"=>0.5, "efficiency"=>0.7, "yardAreaSquareFeet"=>1000, "lastWateredDuration"=>62, "lastWateredDate"=>1462877204801, "scheduleDataModified"=>false, "fixedRuntime"=>0, "saturatedDepthOfWater"=>0.61, "depthOfWater"=>0.51, "maxRuntime"=>10800, "wateringAdjustmentRuntimes"=>{"1"=>3359, "2"=>2799, "3"=>2239, "4"=>1679, "5"=>1120}, "runtime"=>2239}
# h2 = {"id"=>"61197df9-d256-4959-8117-7625f919b2b3", "zoneNumber"=>6, "name"=>"Zone 6", "enabled"=>true, "customNozzle"=>{"name"=>"Rotor Head", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/nozzle/rotor_head.png", "category"=>"ROTOR_HEAD", "inchesPerHour"=>1.0}, "customSoil"=>{"createDate"=>1441831272323, "lastUpdateDate"=>1441831272323, "id"=>"1f9240e5-ba87-4b88-b828-a5f456f399b7", "name"=>"Loam", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/soil/loam.png", "category"=>"LOAM", "infiltrationRate"=>0.35, "editable"=>false, "percentAvailableWater"=>0.7}, "customSlope"=>{"name"=>"Flat", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/slope/flat.png", "variance"=>"ZERO_THREE", "sortOrder"=>0}, "customCrop"=>{"name"=>"Cool Season Grass", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/crop/cool_season_grass.png", "coefficient"=>0.7}, "customShade"=>{"name"=>"Lots of sun", "description"=>"6-8 hours of sun", "imageUrl"=>"https://s3-us-west-2.amazonaws.com/rachio-api-icons/shade/lots_of_sun.png", "exposure"=>1.0}, "availableWater"=>0.17, "rootZoneDepth"=>6.0, "managementAllowedDepletion"=>0.5, "efficiency"=>0.7, "yardAreaSquareFeet"=>1000, "lastWateredDuration"=>160, "lastWateredDate"=>1462877446501, "scheduleDataModified"=>false, "fixedRuntime"=>0, "maxRuntime"=>10800, "saturatedDepthOfWater"=>0.61, "depthOfWater"=>0.51, "wateringAdjustmentRuntimes"=>{"1"=>3359, "2"=>2799, "3"=>2239, "4"=>1679, "5"=>1120}, "runtime"=>2239}
