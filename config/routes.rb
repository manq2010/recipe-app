Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }, sign_out_via: [:get, :post]

  resources :recipes, only: [:index, :show, :new, :edit, :create, :destroy] do
    resources :recipe_foods, only: [:create, :new, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :users
  resources :foods, only: [:index, :show, :new, :edit,:create, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  put '/recipes/:id/toggle_privacy', to: 'recipes#toggle_privacy', as: 'toggle_recipe_privacy'
  # Defines the root path route ("/")
  root "foods#index"
end
