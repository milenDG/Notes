Rails.application.routes.draw do
  get 'home/index'
  get 'contacts/index'
  get 'collections/all'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :collections

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => redirect('home/index')
end
