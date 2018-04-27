Rails.application.routes.draw do
  devise_for :users
  # root path
  root to: 'pages#index'
end
