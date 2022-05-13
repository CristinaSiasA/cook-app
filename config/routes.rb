Rails.application.routes.draw do
  root to: 'main#index'
  #main controller
  get 'about', to: 'main#about'
  # recipe controller
  get 'breakfast', to: 'recipe#breakfast'
  get 'dinner', to: 'recipe#dinner'
  get 'recipes', to: 'recipe#index'
  get 'lunch', to: 'recipe#lunch'
  # authentication controller
  get 'register', to: 'auth#register'
  post 'register', to: 'auth#store_register'
  get 'login', to: 'auth#login'
  post 'login', to: 'auth#store_login'
  delete 'logout', to: 'logout#logout'
end
