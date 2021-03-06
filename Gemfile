source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'cancancan'
gem 'devise'
gem 'devise-i18n'
gem 'jbuilder'
gem 'mini_magick'
gem 'mini_racer', platforms: :ruby
gem 'paper_trail'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'rails-i18n'
gem 'react-rails'
gem 'sentry-raven'
gem 'sidekiq'
gem 'webpacker'

# Создание Excel-файлов
gem 'rubyzip', '>= 1.2.1'
gem 'axlsx', github: 'randym/axlsx' # rubocop:disable Bundler/OrderedGems
gem 'axlsx_rails'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-sidekiq'
  gem 'capistrano3-puma', require: false
  gem 'i18n-debug'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

# ###

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Use postgresql as the database for Active Record
# Use Puma as the app server
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
