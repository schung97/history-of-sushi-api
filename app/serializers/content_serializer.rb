class ContentSerializer < ActiveModel::Serializer
  attributes :id, :fact
  belongs_to :category
end
