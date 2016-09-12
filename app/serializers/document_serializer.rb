class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :filename

  # def id
  #   object.id.to_s
  # end
end
