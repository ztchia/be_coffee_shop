Rails.application.routes.draw do
  get 'categories/create'
  get 'categories/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users,
             path: "",
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               registration: "signup"
             },
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations"
             }
  resource :current_user, only: :show

  resources :stores, only: %i[create index]
  resources :menus, only: %i[create index]
end
