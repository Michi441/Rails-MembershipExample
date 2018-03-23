Rails.application.routes.draw do
  devise_for :users, :path => "", :path_names => {:sign_in => 'login', :sign_out => 'logout',
  :edit => 'profile'}, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users do
    resource :profile
  end

  ## SETUP A ROOT PAGE.
  root 'pages#home'

  get 'about', to: 'pages#about'

  get 'contact-us', to: 'contacts#new'

  resources :contacts, only: [:new, :create]
end
