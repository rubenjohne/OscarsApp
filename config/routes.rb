Oscarsapp::Application.routes.draw do

  resources :prizes do as_routes end
  resources :participants do as_routes end
  resources :choices do as_routes end
  resources :answers do as_routes end
  resources :questions do as_routes end
  resources :days do as_routes end
  resources :questions

  resources :days

  resources :users

  resources :participants

  get '/mobile' => 'pages#mobile'


  get '/1/' => 'pages#1'
  get '/2/' => 'pages#2'
  get '/3/' => 'pages#3'
  get '/4/' => 'pages#4'
  get '/5/' => 'pages#5'
  get '/6/' => 'pages#6'
  get '/7/' => 'pages#7'
  get '/8/' => 'pages#8'
  get '/9/' => 'pages#9'
  get '/10/' => 'pages#10'

  get 'pages/home'

  match '/contest', :to => 'pages#contest', via: :get 

  match 'pages/answer', via: :post 

  match '/signup', :to => 'users#new', via: :get 


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

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
