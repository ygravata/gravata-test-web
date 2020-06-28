Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :company_partial_sales 
  resources :sales
  # Routes for Google authentication
  # get ‘auth/:provider/callback’, to: "sessions#googleAuth"
  # get ‘auth/failure’, to: redirect(‘/’)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end