Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # root path
  root to: 'pages#index'
  get '/dashboard' => 'transactions#new'
  #resources :categories
  resources :transactions, only: [:create]
  
  # change devise routes
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  
end
