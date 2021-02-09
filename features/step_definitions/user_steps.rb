Given('a user with the email {string} exists') do |email|
  User.create(email: email)
end
