class Restaurant < ApplicationRecord
  has_many :suggestions
  has_many :favorites
end
