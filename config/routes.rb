Rails.application.routes.draw do
  root 'appointment#index'
  devise_for :users, controllers: {
      sessions: 'users/sessions'
      
    }
  resources :receptions  
  resources :admins
  resources :doctors 
  resources :patients
  resources :tokens do
    resources :prescriptions
  end
  resources :payments


end
