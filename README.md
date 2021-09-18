# Practical Test (ROR)

###### Tasks

1. Build a Rails application, that have basic features like Login, Registration, Forgot password, etc...
2. After login user can able preform CRUD operation on product list.
3. User can able to create one product (using form)
4. Multiple products (using csv file-browse button).
5. Create an API to add single product using AuthenticationToken.   

###### Key Notes:

* Product’s entity will have: name, price, description etc.
* Use Sidekiq or Any other gem to process csv in background.
* Take any Database as Storage.
* Add Appropriate Validations.
* Use scaffold, Devise or any other gem if you want.


###### At the end you must prepare a document that will have the following things mentioned:

1. Remaining functionality (if any)
2. Which type of problem(s) you’ve faced during the test? (if any)
3. Steps that needs to be executed before running your application (if you have used some gems or other libraries).
4. Prepare a release note of the features you implemented


## Steps are necessary to get the application up and running.

###### Ruby/rails version 
  ruby version ruby-2.3.1
  rails version 4.2.7

###### Use created gemset version
  $ rvm gemset use myshop
  
  $ bundle install

###### Database creation
  Install postgress in your system and change username and password in config/database.yml file
  
  $ rake db:create
  
  $ rake db:migrate
  
  $ rake db:seed

###### Sidekiq and Background Jobs Config
  
  $ sudo apt install redis-server

  $ redis-server (run this command in different tab)

  $ sidekiq (run this command in different tab)


# API Details

###### Login API
URL => http://localhost:3000/api/v1/login
Request type => POST
Required params => email, password
Response => User object with authentication_token
Example=> 
  {
    "id": 1,
    "first_name": "shubham",
    "last_name": "rajput",
    "phone_number": "123456",
    "email": "shubham@example.com",
    "created_at": "2019-12-13T11:54:23.776Z",
    "updated_at": "2019-12-14T08:01:37.005Z",
    "authentication_token": "sfQMYu7SuyYV7fE74bhH"
  }

###### Create Product API
URL => http://localhost:3000/api/v1/product
Resquest Type => POST
Required params in body => name, price, description(optional)
Headers params => Authorization(your authentication token), Content-Type(application/json)
Response => Product object
Example =>
  {
    "id": 1,
    "name": "Shampoo",
    "description": "Natural product",
    "price": "10.25",
    "status": null,
    "created_at": "2019-12-14T09:09:20.563Z",
    "updated_at": "2019-12-14T09:09:20.563Z"
  }

###### LogOut API
URL => http://localhost:3000/api/v1/logout
Resquest Type => DELETE
Headers params => Authorization(your authentication token), Content-Type(application/json)
Response =>
  {
    "success": true,
    "info": "Logged out"
  }
