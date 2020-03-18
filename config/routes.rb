Rails.application.routes.draw do
  namespace :api do
    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    get '/locations' => 'locations#index'
    post '/locations' => 'locations#create'
    get '/locations/:id' => 'locations#show'
    patch '/locations/:id' => 'locations#update'
    delete '/locations/:id' => 'locations#destroy'

    post '/favorites' => 'favorites#create'
    delete '/favorites/:id' => 'favorites#destroy'

    post '/sessions' => 'sessions#create'

    get '/journeys' => 'journeys#index'
    post '/journeys' => 'journeys#create'
    get '/journeys/:id' => 'journeys#show'
    patch '/journeys/:id' => 'journeys#update'
    delete '/journeys/:id' => 'journeys#destroy'
    post '/journeys/:id/add_users' => 'journeys#add_users'

    get '/user_journeys' => 'user_journeys#index'
    post '/user_journeys' => 'user_journeys#create'
    get '/user_journeys/:id' => 'user_journeys#show'
    patch '/user_journeys/:id' => 'user_journeys#update'
    delete '/user_journeys/:id' => 'user_journeys#destroy'
  end
end
