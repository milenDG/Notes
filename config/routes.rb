Rails.application.routes.draw do
  resources :quick_notes
  resources :notes
  resources :notebooks
  get 'home/index'
  get 'contacts/index'
  post 'mail/send', to: 'contacts#send_mail'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => redirect('home/index')
end
