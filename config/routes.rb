Rails.application.routes.draw do
   root "recipe#public_index"

  resources :recipes, only: [:public_index]
end
