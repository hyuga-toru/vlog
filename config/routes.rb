Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  resources :articles
  resources :comments, only: %i[create destroy]
  root "articles#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
