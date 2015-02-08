Rails.application.routes.draw do
<<<<<<< HEAD
=======
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root :to => 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
>>>>>>> 860f74784b9a3a44baf79ea6369ce5a5093cb7df

  # Routes without api subdomain for staging env
  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.copapi.com+json; version=1"}) do
      resources :hits, only: [:index]
    end
  end

  devise_for :users
end
