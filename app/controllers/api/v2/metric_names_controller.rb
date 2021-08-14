class Api::V2::MetricNamesController < ApplicationController
  before_action :set_metric_name, only: [:show]

  # GET /metric_names
  def index
    @metric_names = MetricName.all
    render json: {status:'SUCCESS', message:'Fetched metric name records', data: @metric_names} , status: :ok
  end

  # GET /metric_names/1
  def show
    render json: {status:'SUCCESS', message:'Fetched metric name records', data: @metric_name} , status: :ok
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric_name
      @metric_name = MetricName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metric_name_params
      params.require(:metric_name).permit(:title)
    end
end