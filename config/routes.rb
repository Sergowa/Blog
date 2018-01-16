Rails.application.routes.draw do

  devise_for :users
  resources :publications do
  	resources :comments
  end	
  root "publications#index"

  get '/about', to: 'pages#about'
end
