Rails.application.routes.draw do

  devise_scope :user do
    root "users/sessions#new"
  end

  get 'dashboard/index'

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
