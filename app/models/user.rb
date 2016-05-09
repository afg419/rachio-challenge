class User < ActiveRecord::Base
  has_secure_password

  def find_or_update_devices
    
  end
end
