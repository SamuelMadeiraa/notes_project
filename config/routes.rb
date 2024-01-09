Rails.application.routes.draw do
  root  'notes#index'
  resources :notes
  get 'search', to: 'search#notes'

 
end
