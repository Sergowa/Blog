Rails.application.routes.draw do

  resources :publications do
  	resources :comments
  end	
  root "publications#index"

  get '/about', to: 'pages#about'
end
