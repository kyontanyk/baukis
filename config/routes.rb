Rails.application.routes.draw do
  namespace :staff do
    root 'top#index'
    get 'login' => 'sessions#new'
    # resource :session, only: %i(create destroy)
    post 'session' => 'sessions#create'
    delete 'session' => 'sessions#destroy'
  end

  namespace :admin do
    root 'top#index'
    get 'login' => 'sessions#new'
    # resource :session, only: %i(create destroy)
    post 'session' => 'sessions#create'
    delete 'session' => 'sessions#destroy'
  end

  namespace :customer do
    root 'top#index'
    get 'login' => 'sessions#new'
    # resource :session, only: %i(create destroy)
    post 'session' => 'sessions#create'
    delete 'session' => 'sessions#destroy'
  end
end
