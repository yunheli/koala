class AvatarUploader < CarrierWave::Uploader::Base
  # (Virtual) path where uploaded files will be stored, appended to the
  # gridfs_access_url by methods used with view helpers
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
