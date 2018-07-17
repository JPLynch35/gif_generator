Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :destory]
  end
  resources :gifs, only: [:index]
  resources :users, except: [:destroy, :edit, :update] do
    resources :favorites, only: [:index, :create, :destroy]
  end
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
