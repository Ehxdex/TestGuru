Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :tests do
    resources :questions, shallow: true, except: [:index]
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
