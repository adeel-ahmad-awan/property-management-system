Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }


  get 'page/home'
  get 'page/about'

  root 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
