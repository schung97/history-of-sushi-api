class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :restaurant, :alias_name
  belongs_to :user
  belongs_to :restaurant, serializer: RestaurantSerializer

  def restaurant
    object.restaurant.name
  end

  def alias_name
    object.restaurant.alias
  end

end
