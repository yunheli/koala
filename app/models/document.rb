class Document
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :upload, DocumentUploader, mount_on: :upload_id
end