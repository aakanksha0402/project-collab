Rails.application.routes.draw do

  devise_scope :user do
    root "users/sessions#new"
  end

  resources :projects, except: [:show]

  get 'dashboard', to: "dashboard#index", as: :dashboard

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
