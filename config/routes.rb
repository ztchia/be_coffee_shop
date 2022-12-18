Rails.application.routes.draw do
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

  resources :stores, only: %i[create index], shallow: true do
    resources :menus, only: %i[create index] do
      resources :items, only: %i[create update index]
    end
    resources :orders, only: %i[create show update] do
      resources :payments, only: %i[create show]
    end
  end
  resource :customers, only: %i[create show update] 
  resources :taxes, only: %i[create]
end
