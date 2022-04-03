Rails.application.routes.draw do
  root "homes#index"
  get '*path', to: 'home#index'
end
