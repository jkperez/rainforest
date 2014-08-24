module ApplicationHelper
		def stringify_cost(cost)
		price_in_dollars = sprintf("%.2f", cost)

		place = price_in_dollars.rindex('.') - 3

		while place > 0
			price_in_dollars.insert(place, ',')
			place -= 3
		end

		price_in_dollars
	end

	def formatted_price
		result = "".html_safe

		price_in_dollars = price_in_cents.to_f / 100

		if sale && sale < 100 
			result = "<span class='regular-price'>$#{stringify_cost(price_in_dollars)}</span><br>".html_safe
			price_in_dollars *= sale / 100.0
		end

		result += "<span class='price'>$#{stringify_cost(price_in_dollars)}</span>".html_safe
	end
end
