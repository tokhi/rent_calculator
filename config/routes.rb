Rails.application.routes.draw do
  resources :apartments
  get 'estimations', to: 'estimations#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
