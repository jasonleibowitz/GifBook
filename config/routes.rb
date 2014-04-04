
GifBook::Application.routes.draw do

  resources :users do
    resources :bookmarks, shallow: true
  end
  resources :welcome , :only => [:index]
  resources :tags

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'bookmarks#results'
  get '/find', to: 'users#find'

  root 'welcome#index'

end
