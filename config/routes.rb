Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: %i[index show create] do
    resources :guesses, only: :create
  end
end
