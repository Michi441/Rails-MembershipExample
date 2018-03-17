Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  ## SETUP A ROOT PAGE.
  root 'pages#home'

  get 'about', to: 'pages#about'

  get 'contact-us', to: 'contacts#new'

  resources :contacts, only: [:new, :create]
end
