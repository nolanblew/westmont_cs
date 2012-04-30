WestmontCs::Application.routes.draw do
  get "news/modify"

  get "home/home"

  resources :sessions, only: [:new, :create, :destroy]

  resources :sections do
    resources :pages
  end

  resources :news

  match "news/:category/:id" => "news#show"
  match "news/:category" => "news#list"
  match "news" => "news#list"

  root to: "home#home"

  get "administrator/users"
  get "administrator/sections"
  get "administrator/news"

  match "administrator/:section/pages" => "administrator#pages"
  match "administrator/:section/move_up" => "sections#move_up"
  match "administrator/:section/move_down" => "sections#move_down"
  match "administrator/:section/pages/:page/move_up" => "pages#move_up"
  match "administrator/:section/pages/:page/move_down" => "pages#move_down"

  match "administrator" => "sessions#new"
  match "administrator/logout" => "sessions#destroy", via: :delete

  match ":section/:page" => "page#page"
  match ":section" => "page#home"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
