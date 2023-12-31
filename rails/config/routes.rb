Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
      get "health_check", to: "health_check#index"
      
      namespace :current do
        resource :user, only: [:show]
      end
      resources :articles, only: [:index, :show]
    end
  end
end
