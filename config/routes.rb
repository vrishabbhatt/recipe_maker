Rails.application.routes.draw do
  get 'search/index'
  get 'search' => 'search#index' , as: :search
  post 'search/result' => 'search#search_result' , as: :search_result
  # get  'searchs' => 'search#searchs' ,as: :searchs
  # post 'searchs' => 'search#searchs' ,as: :searchs
  devise_for :users

  root 'static_pages#home'
  get 'index' => 'static_pages#index' 
  get '/recipes' => 'static_pages#index' ,as: :index_page
  get '/recipes/:id' => 'static_pages#show', as: :individual_recipe
  post '/recipes/var' => 'static_pages#var', as: :var
  # for individual user actions regarding the recipie model
  get 'recipie/new' => 'recipie#new' , as: :recipie_new
  post 'recipie/create' => 'recipie#create' ,as: :recipie_create
  get 'recipie/index' => 'recipie#index' ,as: :recipie_index
  get 'recipie/edit' => 'recipie#edit' , as: :recipie_edit
  patch 'recipie/update' => 'recipie#update' , as: :recipie_update
  delete 'recipie/delete/:id' => 'recipie#destroy' , as: :recipie_destroy
  #resources makes the routes simpler
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
