Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
      
      }

 root 'appointment#index'
 resources :doctors
 resources :patients
 resources :tokens
 
end
