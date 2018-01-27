Rails.application.routes.draw do
	root to: 'artists#index'

  resources :artists do
  	resources :songs, only: [:create, :destroy]
  end

  namespace :api do
    resources :artists, except: [:new, :edit] do
      resources :songs, only: [:create, :destroy, :index]
    end
    delete '/artist/:id/songs', to: 'songs#destroy_artist_songs', as: 'destroy_artist_songs'
  end
end
