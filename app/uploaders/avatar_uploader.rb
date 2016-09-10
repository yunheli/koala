class AvatarUploader < CarrierWave::Uploader::Base
  storage :grid_fs
end
