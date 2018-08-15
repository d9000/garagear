Sites::Application.routes.draw do
  devise_for :profiles, controllers: { omniauth_callbacks: "omniauth_callbacks", :registrations => "registrations" }
  
  #match '/auth/:provider/callback' => 'authentications#create'
  #root
  get "garage_ar/index"
  
  
  get "/index2", to: 'garage_ar#index2'
  
  get "account", to: 'account#index'
  
  get "account/privacy"
  
  get "account/sharing"
  
  get "account/notifications"
 
  #
  get "/v/:dominio", to: 'vehs#show'
  
  get "/p/:email", to: 'garage_ar#profile', as: 'p'

  get "/v/:email", to: 'garage_ar#main'
  
  
  #get "inicio/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'garage_ar#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :vehs do
    member do
      get 'edit_avatar'
      get 'edit_marca'
    end
    #resources :build, controller: 'vehs/build'
    
  end
  
  resources :servs, only: [:edit, :update, :show, :destroy, :create ]
  
  scope "vehs/:veh_id" do
    resources :veh_steps
    resources :servs, only: [:new, :index]
    
  end
  
  
  #resources :veh_steps
  #resources :veh_steps
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
