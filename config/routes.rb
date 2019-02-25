Rails.application.routes.draw do
  resources :gliders
  resources :days do
      resources :students
  end
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
