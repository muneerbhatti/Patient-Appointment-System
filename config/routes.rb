Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
      
      }

 root 'appointment#index'
resources :doctors do
    member do
      get :perception
    end
  end

  resources :patients
  resources :tokens
  resources :payments
end

