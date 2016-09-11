class DocsController < ApplicationController

  before_action :set_doc, only: [:show]

  def create
    doc = Document.create(file: params[:file])
    doc.reload
    doc.refresh_attribute
    render json: doc
  end

  def show
    content = @doc.file.read
    if stale?(etag: content, last_modified: @doc.updated_at.utc, public: true)
      send_data content, filename: @doc.file.file.grid_file.filename, type: @doc.file.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end  

  private
  def set_doc
    @doc = Document.find(params[:id])
  end
end