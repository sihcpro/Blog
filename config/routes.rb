Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: %i[show update]
  post '/register', to: 'users#create', as: 'register'
end
