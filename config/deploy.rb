lock '3.11.0'

set :application, 'app.icm-mos.ru'
set :repo_url, 'git@github.com:storkvist/app.icm-mos.ru.git'

set :rbenv_ruby, '2.5.1'
set :deploy_to, '/home/rails/app.icm-mos.ru'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/packs', 'public/system', 'storage', 'node_modules'
append :linked_files, 'config/master.key'

set :puma_init_active_record, true
set :puma_preload_app, true
