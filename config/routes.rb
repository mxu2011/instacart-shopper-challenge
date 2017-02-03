Rails.application.routes.draw do
  root "applicants#new"

  resources :funnels, only: [:index]

  resource :applicants, only: [:create, :edit, :update] do
    get :complete
    post :accept
  end
end
