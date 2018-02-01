class CategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :contents
  has_many :questionnaires
end
