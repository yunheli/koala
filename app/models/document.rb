class Document
  include Mongoid::Document
  include Mongoid::Timestamps
  field :filename, type: String
  field :md5, type: String
  field :content_type, type: String
  field :size, type: String
  mount_uploader :file, DocumentUploader


  def refresh_attribute
    grid_file = file.file.grid_file
    update_attributes(
      filename: file.filename,
      md5: grid_file.md5,
      content_type: grid_file.contentType,
      size: grid_file.length
      )
  end
end