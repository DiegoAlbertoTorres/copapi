Rails.application.routes.draw do
  # Routes without api subdomain for staging env
  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.copapi.com+json; version=1"}) do
      resources :hits, only: [:index, :show]
    end
  end

  devise_for :users
end
