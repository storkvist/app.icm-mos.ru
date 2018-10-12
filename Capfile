require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/rbenv'

require 'capistrano/puma'
install_plugin Capistrano::Puma

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/sidekiq'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
