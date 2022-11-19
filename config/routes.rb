Rails.application.routes.draw do
  resources :maps, only: [:show, :index]
  resources :posts, only: [:index, :show]

  resources :quotes do
    collection do
      post :append
    end
  end
end
