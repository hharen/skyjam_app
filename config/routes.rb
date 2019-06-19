Rails.application.routes.draw do
  resources :days do
    resources :attendances, only: [:create, :destroy]
  end

  resources :students
  resources :gliders
end
