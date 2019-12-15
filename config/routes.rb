Rails.application.routes.draw do

  devise_for :users
  
  root 'products#index'

  namespace :api do
    namespace :v1, defaults:{format: 'json'} do
      post '/product', to: 'products#create'
      post 'login', to: 'users#login'
      delete 'logout', to: 'users#logout'      
    end
  end

  resources :products do
    collection { post :import }
    collection { get :sample_file }
  end
  get 'bulk_import', to: 'products#bulk_import'

end
