class User < ActiveRecord::Base
  include DeviceLoader
  has_secure_password

  def get_or_update_devices(rachio_api_service)
    load_devices(self, rachio_api_service.get_user_devices)
  end
end
