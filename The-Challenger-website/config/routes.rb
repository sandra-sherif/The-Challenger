Rails.application.routes.draw do
<<<<<<< HEAD


  resources :challenges, only: [:index, :new, :create, :destroy]
  root "challenges#index"

  get 'welcome/index'

  devise_for :users
=======
  get 'welcome/index'
  
  
  devise_for :users, controllers: { registrations: "users/registrations" }

>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
#  devise_for :users, controllers: { registrations: "registrations" }
  resources :users
 
  # You can have the root of your site routed with "root"
<<<<<<< HEAD
 
=======
  root 'welcome#index'
  get 'profile/', to: 'profile#show', as: 'profile'
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3

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

  resources :challenges do
    resources :comments
  end

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
