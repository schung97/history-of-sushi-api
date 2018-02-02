class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :username, :email, :knowledge, :avatar
  has_many :suggestions, serializer: SuggestionSerializer
  has_many :favorites, serializer: RestaurantSerializer
end
