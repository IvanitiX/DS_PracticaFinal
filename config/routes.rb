Rails.application.routes.draw do
  resources :estado_propuesta
  resources :propuestas
  resources :tecnicos_controllers
  resources :tecnicos
  resources :mis_tecnicos
  resources :tipo_trabajos
  resources :clientes
  resources :trabajos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      namespace :api, defaults: { format: 'json' }  do
         namespace :v1 do
        	   resources :clientes, :tipo_trabajos, :tecnicos, :trabajos, :propuestas
              get '/propuestas/list/:id', to:'propuestas#list'
         end
      end

      root to: 'pages#home'
      get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      get '/logout',  to: 'sessions#destroy'
      post '/logout',  to: 'sessions#destroy'
      delete '/logout',  to: 'sessions#destroy'
      get '/profile', to: 'clientes#profile'
      get '/trabajos/valorar/:id/:trabajo', to: 'trabajos#valorar'
      get  '/trabajos/valorado/:id/:trabajo', to: 'trabajos#valorar_bd'
end


