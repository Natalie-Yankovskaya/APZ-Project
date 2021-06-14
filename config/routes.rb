Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, :laundries, :modes, :sizes, :washers, :washings, :workers, :services, :breakdowns

  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

end
