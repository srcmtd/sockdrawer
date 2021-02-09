source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'faker', '~> 2.13'
gem 'nokogiri', '>= 1.11.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'geckodriver-bin'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '~> 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "rodauth-rails", "~> 0.10.0"
