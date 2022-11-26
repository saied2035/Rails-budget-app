Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :catagories, only:[:index,:show,:new,:create,:splash_screen] do 
     resources :payments, only: [:new,:create]
  end
  # Defines the root path route ("/")
  unauthenticated do
    root "catagories#splash_screen"
  end
    authenticated :user do
      root 'catagories#index', as: :authenticated_root
    end
end
