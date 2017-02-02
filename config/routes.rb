Rails.application.routes.draw do
  root "applicants#new"

  resources :funnels, only: [:index]

  resource :applicants, only: [:create] do
    get :complete
  end
end
