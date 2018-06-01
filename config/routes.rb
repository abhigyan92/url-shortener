Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'urls#new'
  get "/urls", to: "urls#index"
  get "/:shortened_url", to: "urls#show"
  resources :urls, except: [:show, :edit, :update, :index]
end
