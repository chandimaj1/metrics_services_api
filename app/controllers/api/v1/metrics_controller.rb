class Api::V1::MetricsController < ApplicationController
    before_action :set_metric, only: [:show, :update, :destroy]
  
    # GET /metrics
    def index
      @metrics = Metric.all
      render json: {status:'SUCCESS', message:'Fetched all metric records', data: @metrics}, status: :ok
    end
  
    # GET /metrics/1
    def show
      render json: {status:'SUCCESS', message:'Fetched metric record', data: @metric}, status: :ok
    end

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_metric
        @metric = Metric.find(params[:id])
      end
  end