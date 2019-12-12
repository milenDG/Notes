Rails.application.routes.draw do
  # Specify the 3 RESTful models -> Quick_note, Note and Notebook
  resources :quick_notes
  resources :notes
  resources :notebooks

  # Specify the custom routes
  get 'home/index'
  get 'contacts/index'
  post 'mail/send', to: 'contacts#send_mail'

  # Devise sign out to destroy the current session
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Redirect the root to the index of the home controller
  root :to => redirect('home/index')
end
