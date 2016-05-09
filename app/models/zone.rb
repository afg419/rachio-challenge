class Zone < ActiveRecord::Base
  belongs_to :device

  def dom_format
    {
      rachio_zone_id: rachio_zone_id,
      zoneNumber: zone_number,
      enabled: enabled,
      name: name
    }
  end
end
