Rails.application.routes.draw do
  resources :tipo_trabajos
  resources :clientes
  resources :trabajos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      namespace :api, defaults: { format: 'json' }  do
         namespace :v1 do
        	resources :clientes, :tipo_trabajos, :tecnicos, :trabajos
         end
      end

      root to: 'pages#home'
end


