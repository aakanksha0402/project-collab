Rails.application.routes.draw do

  devise_scope :user do
    root "users/sessions#new"
  end

  resources :projects, except: [:show] do
    get       :add_resources,   on: :member
    post      :save_resources,  on: :member
    delete    :remove_resource, on: :member
    resources :tasks,           except: [:show]
  end

  # controller :users do
  #   get 'index', as: "users"
  # end

  get '/users',                   to: "users#index",        as: :users
  put '/approve_user/:user_id',   to: "users#approve_user", as: :approve_user
  get '/all_tasks',               to: "tasks#all_tasks",    as: :all_tasks
  get 'dashboard',                to: "dashboard#index",    as: :dashboard

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
