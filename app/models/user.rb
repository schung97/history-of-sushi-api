class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  has_many :suggestions
  has_many :restaurants, through: :suggestions
  has_many :restaurants, through: :favorites

  validates_uniqueness_of :email
  validates :firstname, :lastname, :username, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  # accepts_nested_attributes_for :suggestions
end
# , dependent: :destroy
