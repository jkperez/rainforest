class Review < ActiveRecord::Base
	# before_validation(on: :create) do
	# 	return false if self.rating.nil? || self.rating > 5 || self.rating < 0
	# end

  belongs_to :product

  validates :comment, presence: true
  validates :product, :presence => {message: "not found"}
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
