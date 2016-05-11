
def seed_test_user
  User.create(username: ENV["rachio_test_username"],
  password: ENV["rachio_test_password"],
  api_key: ENV["rachio_test_api_key"])
end

seed_test_user
