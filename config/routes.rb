Rails.application.routes.draw do
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]
    resources :categories, except: [:destroy, :edit, :update] do
        resources :questions
    end

    root to: "home#show"
end
