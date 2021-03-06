Sbcdb::Application.routes.draw do

  root to: 'subcontractors#due_for_renewal'
  resources :subcontractors

  match 'help',       to: 'static_pages#help'
  match 'new',        to: 'subcontractors#new'
  match 'renew',      to: 'subcontractors#due_for_renewal'
  match 'scotland',   to: 'subcontractors#scottish_subcons'
  match 'ne_eng',     to: 'subcontractors#ne_eng'
  match 'nw_eng',     to: 'subcontractors#nw_eng'
  match 'se_eng',     to: 'subcontractors#se_eng'
  match 'sw_eng',     to: 'subcontractors#sw_eng'
  match 'london',     to: 'subcontractors#london'
  match 'wales',      to: 'subcontractors#wales'
  match 'midlands',   to: 'subcontractors#midlands'
  match 'approved',   to: 'subcontractors#all_approved'
  match 'labour',     to: 'subcontractors#labour'
  match 'specialist', to: 'subcontractors#specialist'
  match 'both',       to: 'subcontractors#both'
  match 'dashboard',  to: 'subcontractors#dashboard'

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
