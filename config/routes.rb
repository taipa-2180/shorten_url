Rails.application.routes.draw do
  resources :urls, only: [:create, :show] do
    collection do
      get :get_url
    end
  end
end
