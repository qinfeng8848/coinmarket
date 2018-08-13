Rails.application.routes.draw do
  resources :coins do
    member do
      post :update_rank
    end
  end
end
