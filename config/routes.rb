Rails.application.routes.draw do
  resources :boards
  root 'boards#new'
  get '/all', to: 'boards#all', as: 'all'
end
