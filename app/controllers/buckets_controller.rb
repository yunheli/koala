class BucketsController < ApplicationController

  before_action :set_bucket
  def create
    bucket = Bucket.create(param_permit)
    render json: bucket
  end

  def show
    render json: @bucket
  end

  def index
  end

  def update
    @bucket.update(param_permit)
    render :show
  end

  private
  def param_permit
    params.permit(:name, :is_private)
  end

  def set_bucket
    @bucket = Bucket.find(params[:id])
  end
end