Rails.application.routes.draw do
  config = Rails.application.config.baukis # Defined in config/initializers/baukis.rb

  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root 'top#index'
      get 'login' => 'sessions#new'
      resource :session, only: %i(create destroy)
      resource :account, except: %i(new create destroy)
      resource :password, only: %i(show edit update)
      resources :customers
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin , path: config[:admin][:path] do
      root 'top#index'
      get 'login' => 'sessions#new'
      resource :session, only: %i(create destroy)
      resources :staff_members do
        resources :staff_events, only: [ :index ]
      end
      resources :staff_events, only: [ :index ]
    end
  end

  namespace :customer do
    root 'top#index'
    get 'login' => 'sessions#new'
    # resource :session, only: %i(create destroy)
    post 'session' => 'sessions#create'
    delete 'session' => 'sessions#destroy'
  end
end
