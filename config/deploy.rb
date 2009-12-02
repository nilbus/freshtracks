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
