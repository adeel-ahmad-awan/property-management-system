Rails.application.routes.draw do
  get 'users/index'

  devise_for :users, :controllers => { :registrations => "user/registrations" }

  resources :properties
  resources :users

  get 'page/home'
  get 'page/about'
  get 'page/allpropertiesonmap'
  get 'page/users'

  root 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
