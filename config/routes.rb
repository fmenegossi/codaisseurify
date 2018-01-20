Rails.application.routes.draw do
	root to: 'artists#index'

  resources :artists do
  	resources :songs, only: [:create, :destroy]
  end
end
