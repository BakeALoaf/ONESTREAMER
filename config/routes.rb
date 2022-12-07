Rails.application.routes.draw do
  devise_for :users
  root to: "movies#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :platforms, only: %i[index]

  resources :movies, only: %i[index show] do
    resources :favourite_movies, only: %i[create]
  end
  resources :favourite_movies, only: %i[index]
end
