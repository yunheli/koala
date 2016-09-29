source 'https://ruby.taobao.org/'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

gem 'mongoid', '6.0.0.rc0'
gem 'bson_ext'
gem "figaro"
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'active_model_serializers'

gem 'redis', '~> 3.3.1', require: ['redis', 'redis/connection/hiredis']
gem 'hiredis', '~> 0.6.1'
gem 'redis-objects', '~> 1.2.1'
gem 'redis-namespace', '~> 1.5.2'
gem 'oj'
gem 'rack-cors', :require => 'rack/cors'
gem 'kaminari'
gem 'puma_worker_killer'
gem 'kaminari'
gem 'doorkeeper'
gem 'devise'
gem 'lograge'
gem 'sneakers'
gem 'sneakers_packer'

# gem 'moped', '~> 2.0', github: 'mongoid/moped'


# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
