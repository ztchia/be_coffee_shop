Rails.application.routes.draw do
  get 'taxes/create'
  get 'taxes/update'
  get 'taxes/index'
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
  end
end
