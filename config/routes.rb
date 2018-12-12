Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
     resources :books, only: [:show, :index]
     resources :users do
      resources :rents, only: [:create, :index]
     end
     get '/query/book/:isbn', to: 'query_book#query_by_isbn'
    end
   end

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
