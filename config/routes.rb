Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gifs, only: [:index]
  resources :users, except: [:destroy, :show]
  resources :users, only: [:show] do
    resources :favorites, only: [:index, :create, :destroy]
  end
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
