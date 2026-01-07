Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"

  resources :study_sessions, only: [:index, :create, :update] do
    member do
      post :pause
      post :resume
      post :finish
    end
  end

  get "dashboard", to: "dashboard#index"
  
  get "up" => "rails/health#show", as: :rails_health_check
end
