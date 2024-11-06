Rails.application.routes.draw do
 devise_for :users
 root 'appointment#index'
 resources :doctors
 resources :patients
 resources :tokens
end
