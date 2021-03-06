Tourney::Application.routes.draw do
  
  resources :applications, only: [:create, :destroy, :show, :accept, :reject] do
    member do
      post :accept
      post :reject
    end
  end
  resources :invitations, only: [:create, :destroy, :show, :accept, :decline] do
    member do
      post :accept
      post :decline
    end
  end

  resources :vacancies, only: [:create, :destroy, :show]
  resources :memberships, only: [:create, :destroy]
  resources :roles

  resources :tournaments

  resources :teams do
    member do
      get :members
    end
  end

  resources :players do
    member do
      get :invitations
      get :invite
    end
  end

  
  resource :session, only: [:new, :create, :destroy]

  root 'home#welcome'

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
