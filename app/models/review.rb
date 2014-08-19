class Review < ActiveRecord::Base
  belongs_to :product

  validates :comment, presence: true

  validates  :product, :presence => {message: "not found"}
end
