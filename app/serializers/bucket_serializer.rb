class BucketSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_private
end
