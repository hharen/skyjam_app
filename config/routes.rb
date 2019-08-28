Rails.application.routes.draw do

  root to: 'days#index'

  resources :days do
    resources :attendances, only: [:create, :destroy, :show] do
      resources :flights
    end
  end

  resources :students do
    resources :gliders
    resources :additional_flights
    member do
      get :flights
    end
  end

  resources :gliders

  resources :flights

end
