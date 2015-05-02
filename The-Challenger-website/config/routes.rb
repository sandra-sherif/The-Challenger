Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  post 'likes/new' => 'challenges#show'
  
  resources :likes

  resources :responses

  resources :friends

  resources :notifications

  resources :reports

  resources :challenges

  root "challenges#index"

  get 'welcome/index'

  resources :challenges do
    # match :search, to: 'challenges#index', via: :post
    resources :comments
  end

  resources :challenges do
    resources :responses
  end
  
  devise_for :users, controllers: { registrations: "users/registrations" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
   resources :users

   get '/users/:controller/:action/:id/:sent_to/:status/:sent_by', to: 'users#show'
   get '/notifications/:controller/:action/:notification', to: 'notifications#index'
   get '/challenges/:controller/:action/:challenge_id', to: 'responses#new'
   get '/challenges/Likes', to: 'likes#index'
 
  # You can have the root of your site routed with "root"

#This line sets the route of /profile/ to the action show in the profile controller

  get 'profile/', to: 'profile#show', as: 'profile'
  
  #get 'profile/removepicture/', to: 'profile#delete_picture', as: 'removepicture_path'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

 

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:http://guides.rubyonrails.org/routing.html#specifying-a-controller-to-use
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
