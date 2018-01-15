Rails.application.routes.draw do

  resources :publications do
  	resources :comments
  end	
  root "publications#index"
end
