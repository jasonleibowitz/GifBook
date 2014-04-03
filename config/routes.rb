GifBook::Application.routes.draw do

  resources :users do
    resources :bookmarks, shallow: true
  end

end
