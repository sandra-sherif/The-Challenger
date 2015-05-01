{"changed":true,"filter":false,"title":"routes.rb","tooltip":"/The-Challenger-website/config/routes.rb","value":"Rails.application.routes.draw do\n\n  resources :friends\n\n  resources :notifications\n\n  resources :reports\n\n  resources :challenges\n\n  root \"challenges#index\"\n\n  get 'welcome/index'\n\n  resources :challenges do\n    # match :search, to: 'challenges#index', via: :post\n    resources :comments\n  end\n\n  \n  \n  devise_for :users, controllers: { registrations: \"users/registrations\" }\n\n  # The priority is based upon order of creation: first created -> highest priority.\n  # See how all your routes lay out with \"rake routes\".\n   resources :users\n\n   get '/users/:controller/:action/:id/:sent_to/:status/:sent_by', to: 'users#show'\n   get '/notifications/:controller/:action/:notification', to: 'notifications#index'\n \n  # You can have the root of your site routed with \"root\"\n\n#This line sets the route of /profile/ to the action show in the profile controller\n\n  get 'profile/', to: 'profile#show', as: 'profile'\n  \n  #get 'profile/removepicture/', to: 'profile#delete_picture', as: 'removepicture_path'\n  \n  # Example of regular route:\n  #   get 'products/:id' => 'catalog#view'\n\n  # Example of named route that can be invoked with purchase_url(id: product.id)\n  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase\n\n  # Example resource route (maps HTTP verbs to controller actions automatically):\n  #   resources :products\n\n  # Example resource route with options:\n  #   resources :products do\n  #     member do\n  #       get 'short'\n  #       post 'toggle'\n  #     end\n  #\n  #     collection do\n  #       get 'sold'\n  #     end\n  #   end\n\n  # Example resource route with sub-resources:\n  #   resources :products do\n  #     resources :comments, :sales\n  #     resource :seller\n  #   end\n\n  # Example resource route with more complex sub-resources:\n  #   resources :products do\n  #     resources :comments\n  #     resources :sales do\n  #       get 'recent', on: :collection\n  #     end\n  #   end\n\n \n\n  # Example resource route with concerns:\n  #   concern :toggleable do\n  #     post 'toggle'\n  #   end\n  #   resources :posts, concerns: :toggleable\n  #   resources :photos, concerns: :toggleable\n\n  # Example resource route within a namespace:http://guides.rubyonrails.org/routing.html#specifying-a-controller-to-use\n  #   namespace :admin do\n  #     # Directs /admin/products/* to Admin::ProductsController\n  #     # (app/controllers/admin/products_controller.rb)\n  #     resources :products\n  #   end\nend\nFacebookAuthExample::Application.routes.draw do\n    get 'auth/:provider/callback', to: 'sessions#create'\n    get 'auth/failure', to: redirect('/')\n    get 'signout', to: 'sessions#destroy', as: 'signout'\n\n    resources :sessions, only: [:create, :destroy]\n    resource :home, only: [:show]\n\n    root to: \"home#show\"\nend","undoManager":{"mark":-1,"position":34,"stack":[[{"group":"doc","deltas":[{"start":{"row":88,"column":3},"end":{"row":89,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":0},"end":{"row":98,"column":3},"action":"insert","lines":["FacebookAuthExample::Application.routes.draw do","    get 'auth/:provider/callback', to: 'sessions#create'","    get 'auth/failure', to: redirect('/')","    get 'signout', to: 'sessions#destroy', as: 'signout'","","    resources :sessions, only: [:create, :destroy]","    resource :home, only: [:show]","","    root to: \"home#show\"","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":21},"end":{"row":89,"column":32},"action":"remove","lines":["Application"]},{"start":{"row":89,"column":21},"end":{"row":89,"column":22},"action":"insert","lines":["T"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":22},"end":{"row":89,"column":23},"action":"insert","lines":["H"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":22},"end":{"row":89,"column":23},"action":"remove","lines":["H"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":22},"end":{"row":89,"column":23},"action":"insert","lines":["H"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":22},"end":{"row":89,"column":23},"action":"remove","lines":["H"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":22},"end":{"row":89,"column":23},"action":"insert","lines":["h"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":23},"end":{"row":89,"column":24},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":24},"end":{"row":89,"column":25},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":25},"end":{"row":89,"column":26},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":26},"end":{"row":89,"column":27},"action":"insert","lines":["H"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":27},"end":{"row":89,"column":28},"action":"insert","lines":["A"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":28},"end":{"row":89,"column":29},"action":"insert","lines":["L"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":29},"end":{"row":89,"column":30},"action":"insert","lines":["L"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":30},"end":{"row":89,"column":31},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":31},"end":{"row":89,"column":32},"action":"insert","lines":["N"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":32},"end":{"row":89,"column":33},"action":"insert","lines":["G"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":33},"end":{"row":89,"column":34},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":34},"end":{"row":89,"column":35},"action":"insert","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":34},"end":{"row":89,"column":35},"action":"remove","lines":["R"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":33},"end":{"row":89,"column":34},"action":"remove","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":32},"end":{"row":89,"column":33},"action":"remove","lines":["G"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":31},"end":{"row":89,"column":32},"action":"remove","lines":["N"]},{"start":{"row":89,"column":30},"end":{"row":89,"column":31},"action":"remove","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":29},"end":{"row":89,"column":30},"action":"remove","lines":["L"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":28},"end":{"row":89,"column":29},"action":"remove","lines":["L"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":27},"end":{"row":89,"column":28},"action":"remove","lines":["A"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":26},"end":{"row":89,"column":27},"action":"remove","lines":["H"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":25},"end":{"row":89,"column":26},"action":"remove","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":24},"end":{"row":89,"column":25},"action":"remove","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":23},"end":{"row":89,"column":24},"action":"remove","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":22},"end":{"row":89,"column":23},"action":"remove","lines":["h"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":21},"end":{"row":89,"column":22},"action":"remove","lines":["T"]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":0},"end":{"row":99,"column":0},"action":"remove","lines":["FacebookAuthExample::.routes.draw do","    get 'auth/:provider/callback', to: 'sessions#create'","    get 'auth/failure', to: redirect('/')","    get 'signout', to: 'sessions#destroy', as: 'signout'","","    resources :sessions, only: [:create, :destroy]","    resource :home, only: [:show]","","    root to: \"home#show\"","end",""]}]}],[{"group":"doc","deltas":[{"start":{"row":89,"column":0},"end":{"row":98,"column":3},"action":"insert","lines":["FacebookAuthExample::Application.routes.draw do","    get 'auth/:provider/callback', to: 'sessions#create'","    get 'auth/failure', to: redirect('/')","    get 'signout', to: 'sessions#destroy', as: 'signout'","","    resources :sessions, only: [:create, :destroy]","    resource :home, only: [:show]","","    root to: \"home#show\"","end"]}]}]]},"ace":{"folds":[],"scrolltop":1162.5993957519531,"scrollleft":0,"selection":{"start":{"row":98,"column":3},"end":{"row":98,"column":3},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":79,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1430486846215}