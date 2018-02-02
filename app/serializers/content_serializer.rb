class ContentSerializer < ActiveModel::Serializer
  attributes :fact
  belongs_to :category
end
