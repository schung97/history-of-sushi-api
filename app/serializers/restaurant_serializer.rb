class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :rank, :name, :rating, :price, :address, :city, :phone, :review_count, :url, :photos
end
