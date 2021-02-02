Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/users/new', to: 'users#new'
  post '/users', to: "users#create"

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
  get '/days/:id', to: 'days#show'
  patch '/days/:week_id', to: 'days#edit'
  patch '/days', to: 'days#update'
  
  
  get '/days/:id/exercises/new', to: 'exercises#new'
  post 'exercises', to: 'exercises#create'
  delete '/day/:day_id/exercises/:id', to: 'exercises#destroy'
  patch '/exercises/:id/edit', to: 'exercises#edit'
  patch '/exercises/:id/update', to: 'exercises#update'

  get '/profile', to: 'profiles#show'
  get '/profile/edit', to: 'profiles#edit'
  get '/profile/new', to: 'profiles#new'
  patch '/profile', to: 'profiles#update'


end
