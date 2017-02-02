Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :funnels, only: [:index]

  resource :applicants, only: [:new, :create] do
    get :complete
  end
end
