require 'bcrypt'
require 'securerandom'

namespace :accounts do
  desc "Create an Account"
  task create: :environment do
    abort("Usage: EMAIL=admin@example.com rake accounts:create") unless ENV.has_key?('EMAIL')

    email = ENV['EMAIL']
    password = SecureRandom.uuid

    account_id = DB[:accounts].insert(email: email, status: "verified")
    DB[:account_password_hashes].insert(id: account_id, password_hash: BCrypt::Password.create(password))

    puts "Success!"
    puts "The following Account has been created:"
    puts "Email: #{email}"
    puts "Password: #{password}"
  end

end
