Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }

  resources :properties

  get 'page/home'
  get 'page/about'
  get 'page/allpropertiesonmap'

  root 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
