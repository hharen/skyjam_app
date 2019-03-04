Rails.application.routes.draw do
  resources :gliders
  resources :students
  resources :days do
      resources :students, module: :days
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
