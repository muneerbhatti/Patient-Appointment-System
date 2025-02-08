Rails.application.routes.draw do
  root 'appointment#index'
  devise_for :users, controllers: {
      sessions: 'users/sessions'
      
    }

  resources :doctors do
    resources :patients do
    resources :prescriptions
    #spelling thek karnay h, ya galt h, the spel ya h
    # Prescription
    # aggay kar lo k sub?
  end

    
  end
  
  resources :patients
  resources :tokens
  resources :payments
end
