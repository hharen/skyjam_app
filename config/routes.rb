Rails.application.routes.draw do
  resources :gliders
  resources :students
  resources :days do
      resources :students, module: :days do
        resources :flights, only: [:index] do
          # this is the same as:
          # get 'days/:id/students/:id/flights', to: 'students#flights', as: 'flights'
          collection do
              patch 'update_all'
              put 'update_all'
              post 'create_many'
              delete 'destroy_many'
          end
        end
      end
      member do
        post :add_student
      # resources :flights,
      end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
