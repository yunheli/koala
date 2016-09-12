class Bucket
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :is_private, type: Boolean, default: false # 默认是公开的
end
