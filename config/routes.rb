Rails.application.routes.draw do
  root 'application#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users
  resources :users, only: [:show] do
    resources :recipes, only: [:show, :edit, :new]
    resources :sub_styles, only: [:show]
  end
  resources :recipes, only: [:show, :index, :create, :update]
  delete '/recipes/:id' => 'recipes#destroy'
  resources :sub_styles, only: [:index, :show]
  resources :sub_styles, only: [:show] do
    resources :recipes, only: [:show]
  end
  # resources :recipes, only: [:create, :edit, :show] do
  #     resources :recipe_ingredients, only: [:new, :create, :edit]
  # end
  get '*path' => redirect('/')
end
