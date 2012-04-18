# -*- encoding : utf-8 -*-
BFluent::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :toeictests, only: [:new, :create, :destroy]
  resources :casecs, only: [:new, :create, :destroy]
  resources :toeflis, only: [:new, :create, :destroy]
  resources :ielts, only: [:new, :create, :destroy]
  resources :bridges, only: [:new, :create, :destroy]
  resources :toeicsws, only: [:new, :create, :destroy]
  resources :eikens, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/toeic_input', to: 'toeictests#new'
  match '/toeic_journal', to: 'toeictests#toeicjournal'
  match '/casec_input', to: 'casecs#new'
  match '/casec_journal', to: 'casecs#casecjournal'
  match '/toefli_input', to: 'toeflis#new'
  match '/toefli_journal', to: 'toeflis#toeflijournal'
  match '/ielt_input', to: 'ielts#new'
  match '/ielt_journal', to: 'ielts#ieltjournal'
  match '/bridge_input', to: 'bridges#new'
  match '/bridge_journal', to: 'bridges#bridgejournal'
  match '/toeicsw_input', to: 'toeicsws#new'
  match '/toeicsw_journal', to: 'toeicsws#toeicswjournal'
  match '/eiken_input', to: 'eikens#new'
  match '/eiken_journal', to: 'eikens#eikenjournal'

  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/principles',    to: 'static_pages#principles'
  match '/pricing',    to: 'static_pages#pricing'

 
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
