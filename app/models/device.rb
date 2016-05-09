class Device < ActiveRecord::Base
  belongs_to :user
  has_many :zones, dependent: :destroy

  def dom_format
    dom_zones = zones.map do |zone|
      zone.dom_format
    end

    {
      rachio_device_id: rachio_device_id,
      status: status,
      on: on,
      zones: dom_zones
    }
  end
end
