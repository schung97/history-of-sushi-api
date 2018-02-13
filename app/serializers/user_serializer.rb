class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :username, :knowledge, :avatar
  has_many :suggestions, serializer: SuggestionSerializer
  has_many :favorites, serializer: FavoriteSerializer
end
