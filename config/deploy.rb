require 'bundler/capistrano'
set :user, 'citychurch-s'
set :domain, "69.164.215.137"
set :applicationdir, "production.git"

set :application, "citychurch"
set :repository,  "ssh://citychurch-s@69.164.215.137/~/production.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :scm_verbose, true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "69.164.215.137"                          # Your HTTP server, Apache/etc
role :app, "69.164.215.137"                          # This may be the same as your `Web` server
#role :db,  "69.164.215.137", :primary => true # This is where Rails migrations will run
#role :db,  "69.164.215.137"

set :deploy_to, 'production.git'
set :deploy_via, :export

default_run_options[:pty] = true
# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path, 'restart.txt')}"
  end
end
