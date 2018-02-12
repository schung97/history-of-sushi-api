class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :rank, :restaurant, :restaurant_id, :rating, :address, :phone, :review_count, :url, :price, :photos
  belongs_to :user
  belongs_to :restaurant

  def rank
    object.restaurant.rank
  end

  def restaurant_id
    object.restaurant.id
  end

  def restaurant
    object.restaurant.name
  end

  def rating
    object.restaurant.rating
  end

  def address
    object.restaurant.address
  end

  def phone
    object.restaurant.phone
  end

  def review_count
    object.restaurant.review_count
  end

  def url
    object.restaurant.url
  end

  def price
    object.restaurant.price
  end

  def photos
    object.restaurant.photos
  end

end
