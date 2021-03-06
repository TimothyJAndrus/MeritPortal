Rails.application.routes.draw do
  devise_for :mentors, :controllers => {registrations: 'registrations'}
  devise_for :mentees, :controllers => { registrations: 'registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  resources :survey do
    member do
      get "survey_response" => "survey#survey_response"
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

  root 'home#index'

  get 'home/about' => 'home#about'

  get 'home/help' => 'home#help'

  get 'mentee/'  => 'mentee#home', as: :mentee_home

  get 'mentee/list_surveys' => 'mentee#list_surveys'

  get 'mentee/answers/:survey_id' => 'mentee#answers', as: :mentee_answers

  get 'mentor/edit/:mentor_id' => 'mentor#edit', as: :edit_mentor

  match 'mentor/destroy/:mentor_id' => 'mentor#destroy', via: :delete, as: :destroy_mentor

  get 'mentor/' => 'mentor#home', as: :mentor_home

  # get 'survey/show' => 'survey#show'
  #
  # get 'survey/index'=> 'survey#index'

  # get 'survey/:survey_id/survey_response/' => 'survey#survey_response'

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
