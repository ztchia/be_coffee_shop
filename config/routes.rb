Rails.application.routes.draw do
  get 'stores/create'
  get 'stores/update'
  get 'stores/show'
  get 'stores/index'
  get 'menus/create'
  get 'menus/update'
  get 'menus/show'
  get 'menus/index'
  get 'menus/destroy'
  get 'create/update'
  get 'create/show'
  get 'create/index'
  get 'create/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/current_user', to: 'current_user#index'
end
