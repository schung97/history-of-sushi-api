class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :alias
  has_many :suggestions
  has_many :favorites
end
