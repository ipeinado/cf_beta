Rails.application.routes.draw do

  get 'support', to: 'messages#manifest_support', as: 'support'
  post 'messages/manifest_support', to: 'messages#create_manifest_support'

  get 'events/index'

  get 'venues/index'

  get 'categories/show'

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'manifiesto', to: 'static_pages#manifest'
  get I18n.t(:find_out), to: 'static_pages#findout'

  # Log in and log out
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'events/tag/:tag', to: 'events#tag', as: 'tag'

    get '/auth/twitter/callback', to: 'users#create_user_from_twitter'
    get '/auth/facebook/callback', to: 'users#create_user_from_facebook'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Users routes

  resources :users, :projects, :promos, :venues, :events, :entities
  resources :categories, only: [:index, :show]

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
