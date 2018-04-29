Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # root path
  root to: 'pages#index'
  # get '/dashboard' => 'transactions#index'
  # post '/transaction' => 'transactions#create'
  resources :transactions
  
  # change devise routes
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  
end
