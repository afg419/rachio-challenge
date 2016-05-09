require 'rails_helper'

RSpec.describe User, type: :model do
  it "returns nil devices with illegal api_key" do
    VCR.use_cassette 'illegal api_key' do
      user = User.create(username: "a", password: "b")
      ras = RachioApiService.new(user)
      reply = user.get_or_update_devices(ras)
      expect(reply).to eq nil
    end
  end

  it "gets json devices with legal api_key" do
    VCR.use_cassette 'legal api_key' do
      user = make_test_user

      expect(user.devices.count).to eq 0

      ras = RachioApiService.new(user)
      user.get_or_update_devices(ras)

      expect(user.devices.count).to eq 1
      device = user.devices.first

      expect(device.zones.count).to eq 8
    end
  end
end
