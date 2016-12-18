Rails.application.routes.draw do
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth'
        # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
        resources :users
        resources :links
      end
    end
  end
end
