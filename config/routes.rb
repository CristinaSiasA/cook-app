Rails.application.routes.draw do
  root to: 'main#index'
  #main controller
  get 'about', to: 'main#about'
  # recipe controller
  get 'breakfast', to: 'recipe#breakfast'
  get 'dinner', to: 'recipe#dinner'
  get 'recipes', to: 'recipe#index'
  get 'recipes/:id', to: 'recipe#show'
  get 'lunch', to: 'recipe#lunch'
  # authentication controller
  get 'register', to: 'auth#register'
  post 'register', to: 'auth#store_register'
  get 'login', to: 'auth#login'
  post 'login', to: 'auth#store_login'
  delete 'logout', to: 'logout#logout'
  # user recipe
  get '/users/recipe/create', to: 'user_recipe#create'
  get '/users/recipes/:id/edit', to: 'user_recipe#edit'
  post '/users/recipes/:id/edit', to: 'user_recipe#edit_recipe'
  post '/users/recipes/:id/delete', to: 'user_recipe#delete'
  get '/users/recipes', to: 'user_recipe#index'
  post '/users/recipe/create', to: 'user_recipe#store_recipe'
end
