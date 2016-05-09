Rails.application.routes.draw do
  root 'rachio#index'

  namespace :api do
    namespace :v1 do
      post 'login' => 'sessions#create'
      delete 'login' => 'sessions#destroy'
      resource :user, only: [:show]
    end
  end
end
