Rails.application.routes.draw do
  get 'pets/index'
  get 'pets/show'
  get 'pets/new'
  get 'pets/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 
  resources :pets # create pets resource RESTful urls
  root 'pets#index'  # set root route
end
