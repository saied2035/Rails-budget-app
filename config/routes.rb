Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :catagories, only:[:index,:show,:new,:create,:splash_screen]
  # Defines the root path route ("/")
  root "catagories#splash_screen"
end
