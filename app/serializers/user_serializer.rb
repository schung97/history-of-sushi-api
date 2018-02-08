class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :username, :email, :knowledge, :avatar, :joined_on
  has_many :suggestions, serializer: SuggestionSerializer
  has_many :favorites, serializer: FavoriteSerializer
end
