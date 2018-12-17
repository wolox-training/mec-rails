Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
     resources :books, only: [:show, :index]
     resources :book_suggestions, only: [:create]
     resources :users do
      resources :rents, only: [:create, :index]
     end
    end
   end

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
