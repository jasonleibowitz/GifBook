
GifBook::Application.routes.draw do

  resources :users do
    resources :bookmarks, shallow: true
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'welcome#index'


end
