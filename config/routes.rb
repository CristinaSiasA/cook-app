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
  get 'login', to: 'auth#login'
end
