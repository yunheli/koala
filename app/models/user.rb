
# app/models/user.rb
class User
  include Mongoid::Document
  mount_uploader :avatar, AvatarUploader
end