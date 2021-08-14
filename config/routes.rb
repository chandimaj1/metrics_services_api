Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :metric_names do
        resources :metrics
      end
    end

    namespace :v2 do
      resources :metric_names
      resources :metrics
    end
  end
end