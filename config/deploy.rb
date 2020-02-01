# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "roomer"
set :repo_url, "git@github.com:g-maiyazu/roomer.git"
set :deploy_to, "/var/www/rails/roomer"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push("config/settings.yml")

set :pty, true

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

# 過去分のデプロイの保存数を指定
set :keep_releases, 5

set :rbenv_ruby, '2.6.3'

set :log_level, :debug

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'upload settings.yml'
  task :upload do
    on roles(:app) do |_host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/settings.yml', "#{shared_path}/config/settings.yml")
    end
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
