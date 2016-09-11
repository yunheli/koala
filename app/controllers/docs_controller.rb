class DocsController < ApplicationController

  before_action :set_doc, only: [:show]

  def create
    doc = Document.create(upload: params[:file])
    render json: doc
  end

  def show
    content = @doc.upload.read
    # if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, filename: @doc.upload.file.grid_file.filename, type: @doc.upload.file.content_type, disposition: "inline"
      expires_in 0, public: true
    # end
  end  

  private
  def set_doc
    @doc = Document.find(params[:id])
  end
end