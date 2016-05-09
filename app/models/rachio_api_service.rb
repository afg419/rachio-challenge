class RachioApiService
  attr_reader :api_key, :root_url, :user_rachio_id

  def initialize(user)
    @api_key = user.api_key
    @root_url = "https://api.rach.io/1/public"
    @user_rachio_id = user.rachio_id ||= get_user_rachio_id
  end

  def get_user_rachio_id
    get("/person/info")["id"]
  end

  def get_user_devices
    get("/person/#{user_rachio_id}")["devices"]
  end

  def get(path)
    uri = URI(root_url + path)
    req = Net::HTTP::Get.new(uri, "Authorization" => "Bearer #{api_key}")
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") {|http|
      http.request(req)
    }
    JSON.parse(res.body)
  end

  def put(path, post_body)
    uri = URI(root_url + path + "/")
    req = Net::HTTP::Post.new(uri, "Authorization" => "Bearer #{api_key}")
    req.body = post_body
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }
    JSON.parse(res.body)
  end
end
