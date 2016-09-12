class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :filename, :md5, :content_type, :size
end
