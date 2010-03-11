
set :branch, "master"

set :application, "Mini BGG"
set :repository,  "git@github.com:wildjcrt/jcrtrails.git"
set :scm, "git"

set :deploy_to, "/home/jcrt/project/jcrtrails/"

default_run_options[:pty] = true

set :user, "apps"
set :group, "apps"

set :rake, "/opt/ruby/bin/rake"


set :deploy_via, :remote_cache

set :use_sudo, false
ssh_options[:paranoid] = false

# This's because Capistrano will not load environment variables
default_environment["PATH"] = "/opt/ruby/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11:/usr/games" # Ubuntu Slice
default_environment["RAILS_ENV"] = "development"

role :web, "rails.s3p.org"
role :app, "rails.s3p.org"
role :db, "rails.s3p.org", :primary => true

namespace :deploy do
  
  desc "Create database.yml and asset packages for development"
  task :after_update_code, :roles => [:web] do
    db_config = "#{shared_path}/config/database.yml.development"
    run "cp #{db_config} #{release_path}/config/database.yml"        
  end

  desc "Restart mod_rails"
  task :restart, :roles => [:app] do
    run "touch /tmp/restart.txt"
  end
  
  desc "Re-establish symlinks"
  task :after_symlink do
  end

end
