Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gifs, only: [:index]
  resources :favorites, only: [:index]
  resources :users, only: [:new, :show]
  root 'welcome#index'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
