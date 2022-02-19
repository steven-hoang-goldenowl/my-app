Rails.application.routes.draw do
  root to: 'users#index'
  resources :users do
    collection do
      get :confirm_email
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
