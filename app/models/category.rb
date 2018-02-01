class Category < ApplicationRecord
  has_many :contents
  has_many :questionnaires

  validates_uniqueness_of :name
end
