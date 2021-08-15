Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/non_empty_metric_names', to: 'metric_names#non_empty_metric_names'
      get '/metric_names_list', to: 'metric_names#metric_names_list'
      resources :metric_names do
        resources :metrics
      end
    end

    namespace :v2 do
      get '/metrics_list', to: 'metrics#metrics_list'
      get '/metrics_for_metric_name', to: 'metrics#metrics_for_metric_name'
      resources :metric_names
      resources :metrics
    end
  end
end