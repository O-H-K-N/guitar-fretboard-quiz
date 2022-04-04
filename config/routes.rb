Rails.application.routes.draw do
  root "homes#index"

  namespace :api do
    resources :quizzes
  end

  get '*path', to: 'home#index'
end
