Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    root to: 'root#index'
    resources :users, only: [:new, :create, :edit, :update]
    resource :sessions, only: [:new, :create, :destroy]
    get 'home', to: 'home#index'
  end
end
