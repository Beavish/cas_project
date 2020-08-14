Rails.application.routes.draw do
  get 'data/index'
  get 'content/world'
  get 'content/politics'
  get 'content/sport'
  get 'content/design'
  get 'content/culture'
  get 'content/business'
  get 'content/travel'
  get 'content/science'
  get 'content/opinion'
  get 'content/technology'
  get 'content/health'
  get 'welcome/index'
  get 'content/weather'
  get 'data/admin'
  post '/data/update_current_user_to_admin'
  post '/data/update_current_user_to_journalist'
  get '/data/subscription_seach'

  #match '/checkout/token' => 'checkout#create', via: :get
  devise_for :users
  resources :posts

resources :users do
  resources :checkouts
end
  
resources :data do
  get "word_count"
end

  resources :checkouts,  only: [:new, :create,:show] do
    
  end


  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
