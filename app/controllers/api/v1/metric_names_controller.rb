class Api::V1::MetricNamesController < ApplicationController
  before_action :set_metric_name, only: [:show, :update, :destroy]

  # GET /metric_names
  def index
    @metric_names = MetricName.all

    render json: @metric_names
  end

  # GET /metric_names/1
  def show
    render json: @metric_name
  end

  # POST /metric_names
  def create
    @metric_name = MetricName.new(metric_name_params)

    if @metric_name.save
      render json: @metric_name, status: :created
    else
      render json: @metric_name.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /metric_names/1
  def update
    if @metric_name.update(metric_name_params)
      render json: @metric_name
    else
      render json: @metric_name.errors, status: :unprocessable_entity
    end
  end

  # DELETE /metric_names/1
  def destroy
    @metric_name.destroy
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
