require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace 'api' do
    resources :alerts, only: :add_alert do
      collection do
        post 'add_alert'
      end
    end
  end
end
