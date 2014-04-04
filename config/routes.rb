
GifBook::Application.routes.draw do

  resources :users do
    resources :bookmarks, shallow: true
  end
  resources :welcome , :only => [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'bookmarks#results'

  root 'welcome#index'

end
