class Product < ActiveRecord::Base
	validates :description, :name, presence: true
	validates :price_in_cents, numericality: { only_integer: true, greater_than: 0 }
	validates :price_in_cents, numericality: { less_than: (2**31)-1, message: "is too large. Largest allowable value is 21.4 million dollars."}

	belongs_to :category

	has_many :reviews

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100

		price_in_dollars = sprintf("%.2f", price_in_dollars)

		place = price_in_dollars.rindex('.') - 3

		while place > 0
			price_in_dollars.insert(place, ',')
			place -= 3
		end

		"$" + price_in_dollars;
	end

	def image_tag
		"<img src=\"#{picture}\" alt=\"#{name}\" class=\"product\">".html_safe
	end

	def number_of_reviews
		reviews.count
	end

	def average_review
		rating_count = number_of_reviews;
		
		if (rating_count == 0)
			return 0
		end

		rating_total = 0
		
		reviews.each { |review| 
			rating_total += review.rating
		}

		sprintf("%.1f", rating_total.to_f / rating_count)
	end
end