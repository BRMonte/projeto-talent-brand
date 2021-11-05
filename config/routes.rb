Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  resources :notes

  root to: "pages#home"
end
