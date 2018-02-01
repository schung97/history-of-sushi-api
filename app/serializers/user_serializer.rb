class UserSerializer < ActiveModel::Serializer
  attributes *User.column_names
  has_many :suggestions, serializer: SuggestionSerializer
  has_many :favorites, serializer: RestaurantSerializer
end
