Rails.application.routes.draw do
  root'welcome#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
  resources :rooms do
    resources :messages
  end
  default_url_options :host => "localhost:300"
end
