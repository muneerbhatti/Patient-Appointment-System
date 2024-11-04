Rails.application.routes.draw do
  devise_for :users
 root 'appointment#index'
  
end
