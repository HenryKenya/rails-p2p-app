Rails.application.routes.draw do
  devise_for :users
  # root path
  root to: 'pages#index'

  # change devise routes
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
end
