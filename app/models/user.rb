class User < ActiveRecord::Base
  include DeviceLoader
  has_secure_password
  has_many :devices, dependent: :destroy

  def get_or_update_devices(rachio_api_service)
    if rachio_api_service.legal_api_key?
      load_devices(rachio_api_service)
    end
  end

  def dom_format
    dom_devices = devices.map do |device|
      device.dom_format
    end

    {
      user: {username: username, devices: dom_devices},
      message: "Logged in as #{username}",
    }
  end
end
