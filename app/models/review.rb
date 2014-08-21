class Review < ActiveRecord::Base
  belongs_to :product

  validates :comment, presence: true
  validates :product, :presence => {message: "not found"}
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
