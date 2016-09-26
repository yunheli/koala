class BucketsController < ApplicationController

  def create
    bucket = Bucket.create(param_permit)
    render json: bucket
  end

  def show
  end

  def index
  end

  def update
  end

  private
  def param_permit
    params.permit(:name, :is_private)
  end
end