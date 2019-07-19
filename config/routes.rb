Rails.application.routes.draw do
  resources :days do
    resources :attendances, only: [:create, :destroy, :show] do
      resources :flights
    end
  end

  resources :students do
    resources :gliders
  end

  resources :gliders

  resources :flights
end
