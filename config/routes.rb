Rails.application.routes.draw do
  devise_for :users

  resources :members, only: %i[ show new create ]
  resources :expenses
  resources :budgets
  resources :families

  root 'families#index'
end
