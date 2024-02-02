Rails.application.routes.draw do
   root "recipe#public_index"

  resources :recipe, only: [:public_index, :show] do 
    member do
      patch :toggle_public
      get 'modal'
      
      get '/shopping_list', to: 'recipe#shopping_list', as: 'shopping_list'
    end
  end


  get "/recipe/show" => 'recipe#show'
end

