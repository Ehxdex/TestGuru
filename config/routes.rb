Rails.application.routes.draw do
  get :signup, to: 'users#new'

  root 'tests#index'

  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
