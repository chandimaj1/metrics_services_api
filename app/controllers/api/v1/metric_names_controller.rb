class Api::V1::MetricNamesController < ApplicationController
  before_action :set_metric_name, only: [:show, :update, :destroy]

  # GET /metric_names
  def index
    @metric_names = MetricName.all
    render json: @metric_names
  end

  # GET /metric_names_list
  def metric_names_list
    @metric_names = MetricName.all
    render json: @metric_names, include: ['metric'], status: :ok
  end


  # GET /non_empty_metric_names
  def non_empty_metric_names
    @metric_names = MetricName.includes(:metrics).reject{ |metric_name| metric_name.metrics.count == 0 }
    render json: @metric_names, include: ['metric'], status: :ok
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
