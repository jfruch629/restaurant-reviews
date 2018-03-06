class Review < ApplicationRecord
  belongs_to :restaurant

  validates_presence_of :rating
  validates_presence_of :body
end
