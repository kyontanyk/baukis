Rails.application.routes.draw do
  namespace :staff do
    root 'top#index'
    get 'login' => 'sessions#new'
    resource :session, only: %i(create destroy)
    # post 'session' => 'sessions#create'
    # delete 'session' => 'sessions#destroy'
    resource :account, except: %i(new create destroy)
    # get 'account' => 'accounts#show'
    # get 'account/edit' => 'accounts#edit'
    # patch 'account' => 'accounts#update'
  end

  namespace :admin do
    root 'top#index'
    get 'login' => 'sessions#new'
    resource :session, only: %i(create destroy)
    # post 'session' => 'sessions#create'
    # delete 'session' => 'sessions#destroy'
    resources :staff_members
    # get 'staff_members' => 'staff_members#index'
    # get 'staff_members/:id' => 'staff_members#show'
    # get 'staff_members/new' => 'staff_members#new'
    # get 'staff_members/:id/edit' => 'staff_members#edit'
    # post 'staff_members' => 'staff_members#create'
    # patch 'staff_members/:id' => 'staff_members#update'
    # delete 'staff_members/:id' => 'staff_members#destroy'
  end

  namespace :customer do
    root 'top#index'
    get 'login' => 'sessions#new'
    # resource :session, only: %i(create destroy)
    post 'session' => 'sessions#create'
    delete 'session' => 'sessions#destroy'
  end
end
