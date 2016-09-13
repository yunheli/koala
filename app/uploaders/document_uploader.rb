class DocumentUploader < CarrierWave::Uploader::Base
  storage :grid_fs
  
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    original_filename
  end
end
