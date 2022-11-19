Rails.application.routes.draw do
  get 'maps/show'
  get 'maps/index'
  resources :posts, only: [:index, :show]

  resources :quotes do
    collection do
      post :append
    end
  end
end
