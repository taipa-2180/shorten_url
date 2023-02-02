Rails.application.routes.draw do
  resources :urls, only: [] do
    collection do
      post :encode 
      get :decode
    end
  end
end
