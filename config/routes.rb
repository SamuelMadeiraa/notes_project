Rails.application.routes.draw do
  get 'users/index'
  root  'notes#index'
  resources :notes
  get 'search', to: 'search#notes'

 
end
