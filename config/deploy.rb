set :application, "freshtracks"
set :repository,  "git://github.com/nilbus/freshtracks.git"

set :scm, :git

set :deploy_to, "/srv/rails/freshtracks"
set :runner, "www-data"
set :branch, "master"
set :git_enable_submodules, 1

role :web, "freshtracks.nilbus.com"
role :app, "freshtracks.nilbus.com"
role :db,  "freshtracks.nilbus.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

namespace :deploy do
  desc "Load fixtures into the production database"
  task :load_fixtures, :roles => :db do
    run "cd #{current_path}; rake db:fixtures:load RAILS_ENV=production"
  end

  desc "Reset the database"
  task :reset_db, :roles => :db do
    run "cd #{current_path}; rake db:reset RAILS_ENV=production"
  end
end

after "deploy:symlink", "deploy:reset_db"
after "deploy:symlink", "deploy:load_fixtures"
