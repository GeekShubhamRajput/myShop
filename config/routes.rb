Rails.application.routes.draw do
  resources :products
  devise_for :users
  
  root 'products#index'

  namespace :api do
    namespace :v1, defaults:{format: 'json'} do
      post '/product', to: 'products#create'
      post 'login', to: 'users#login'
      delete 'logout', to: 'users#logout'      
    end
  end

end
