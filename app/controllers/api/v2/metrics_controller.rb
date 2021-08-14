class Api::V2::MetricsController < ApplicationController
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

    # POST /metrics/ expects JSON {"metric_name_id":1, "value":5}
    def create
      @metric = Metric.new(metric_params)
  
      if @metric.save
        render json: {status:'SUCCESS', message:'Created new metric record for metric name id:'+params[:metric_name_id].to_s, data: @metric}, status: :created
      else
        render json: {status:'ERROR', message:'Error creating new metric record for metric name id:'+params[:metric_name_id].to_s, data: @metric.errors}, status: :unprocessable_entity
      end
    end
  
    # PUT/PATCH /metrics/ expects JSON {id=2, "value":5}
    def update
      if @metric.update(metric_update_params)
        render json: {status:'SUCCESS', message:'Updated metric record for id:'+params[:id].to_s, data: @metric}, status: :ok
      else
        render json: {status:'ERROR', message:'Error updating metric record for id:'+params[:id].to_s, data: @metric.errors}, status: :unprocessable_entity
      end
    end
  
    # DELETE /metric_names/1
    def destroy
      @metric.destroy
      render json: {status:'SUCCESS', message:'Deleted metric record for id:'+params[:id].to_s, data: @metric}, status: :ok
    end

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_metric
        @metric = Metric.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def metric_params
        params.require(:metric).permit(:value, :metric_name_id)
      end

      # Only allow a list of trusted parameters through.
      def metric_update_params
        params.require(:metric).permit(:value)
      end
  end