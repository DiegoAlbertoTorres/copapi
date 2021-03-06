Rails.application.routes.draw do
  # Routes without api subdomain for staging env
  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.copapi.com+json; version=1"}) do
      resources :hits, only: [:index, :show, :create]
    end
  end
  get 'map', to:'map#map'
  get 'charts', to:'charts#chart'
  get 'index',to:'home#index'
  get 'search', to:'search#search'
  root :to => 'home#index'
  devise_for :users
end
