Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
      
      }

 root 'appointment#index'
 resources :doctors do 
  number do
    get :perception
  end
 resources :patients
 resources :tokens
 resources :payments
end
