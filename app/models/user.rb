class User < ActiveRecord::Base
  include DeviceLoader
  has_secure_password
  has_many :devices

  def get_or_update_devices(rachio_api_service)
    if rachio_api_service.legal_api_key?
      load_devices(rachio_api_service)
    end
  end

  # def format_device_info
  #   devices.map do |device|
  #
  #   end
  # end
end
