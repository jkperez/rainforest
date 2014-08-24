class CartController < ApplicationController
  def show
  	@cart = Cart.take
  end
end
