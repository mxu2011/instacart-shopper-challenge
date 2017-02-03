Rails.application.routes.draw do
  root "static_pages#index"

  resources :funnels, only: [:index]

  resource :applicants, only: [:new, :create, :edit, :update, :show] do
    get :complete
    post :accept
  end
end
