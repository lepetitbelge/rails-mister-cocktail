Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails do
      resources :doses, only: [:new, :create]
    end

    resources :doses, only: [:show, :edit, :update, :destroy]
end
