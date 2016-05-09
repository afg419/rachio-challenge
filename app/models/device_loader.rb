module DeviceLoader
  def load_devices(rachio_api_service)
    devices_json = rachio_api_service.get_user_devices
    user = rachio_api_service.user
    binding.pry
    devices_json.each do |device|
      db_device = user.devices.find_or_create_by(rachio_device_id: device["id"])
      db_device.status = device["status"]
      db_device.on = device["on"]
      db_device.name = device["name"]
      load_zones(db_device, device["zones"])
      db_device.save
    end
  end

  def load_zones(db_device, zones_json)
    zones_json.each do |zone|
      db_zone = db_device.zones.find_or_create_by(rachio_zone_id: zone["id"])
      binding.pry
      db_zone.zone_number = zone["zoneNumber"]
      db_zone.name = zone["name"]
      db_zone.enabled = zone["enabled"]
      db_zone.save
    end
  end
end
