Rails.application.routes.draw do
  resources :urls, only: [] do
    collection do
      post :encode 
    end
  end
  get "/:code", to: "urls#decode", as: :decode
end
