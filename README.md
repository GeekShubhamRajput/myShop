## Steps are necessary to get the application up and running. ##

#### Ruby/rails version ####
  ruby version ruby-2.3.1
  rails version 4.2.7

#### Use created gemset version ####
  $ rvm gemset use myshop
  
  $ bundle install

#### Database creation ####
  Install postgress in your system and change username and password in config/database.yml file
  
  $ rake db:create
  
  $ rake db:migrate
  
  $ rake db:seed

#### Sidekiq and Background Jobs Config ####
  
  $ sudo apt install redis-server

  $ redis-server (run this command in different tab)

  $ sidekiq (run this command in different tab)
