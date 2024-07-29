Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
              controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index
  resources :gists, only: :create

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: [:index] do
        resources :answers, shallow: true
      end
    end

    resources :gists, only: :index
    resources :badges
    resources :feedbacks
  end
end
