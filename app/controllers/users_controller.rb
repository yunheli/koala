class UsersController < ApplicationController

  before_action :set_user
  def avatar
    content = @user.avatar.read
    # if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, filename: @user.avatar.file.grid_file.filename, type: @user.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    # end
  end

  def file
    @user.avatar = params[:file]
    @user.save
    render json: {
      message: "ok"
    }
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end