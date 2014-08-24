class CartController < ApplicationController
  def show
  end

  def purchase
  	@cart.cart_items.each do |cart_item|
  		cart_item.destroy
  	end

  	respond_to do |format|
				format.html { redirect_to root_path, notice: "Thank you for your purchase!" }
			end
		end
end
