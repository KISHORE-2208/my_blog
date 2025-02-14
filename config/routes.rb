Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]  # Ensure destroy is included
  end
end
