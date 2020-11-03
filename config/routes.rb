Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/users/new', to: 'users#new'
  post '/users', to: "users#create"
  get '/profile', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'workouts/new', to: 'workouts#new'
  post 'workouts', to: 'workouts#create'
  get '/workouts', to: 'workouts#index'
  get '/workouts/:id', to: 'workouts#show'
  delete '/workouts/:id', to: 'workouts#destroy'

  get 'weeks/:id/new', to: 'weeks#new'
  post 'weeks', to: 'weeks#create'
  get 'weeks/:id', to: 'weeks#show'
  delete 'weeks/:id', to: 'weeks#destroy'


  post '/days/:week_id', to: 'days#create'
  

end
