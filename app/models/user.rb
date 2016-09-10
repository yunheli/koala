
# app/models/user.rb
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :avatar, AvatarUploader
end