Rails.application.routes.draw do

  resources :users
  resources :tasks

  post 'login/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
