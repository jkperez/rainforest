class ApplicationController < ActionController::Base
	before_action :set_cart
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def set_cart
  		unless session[:cart]
  			session[:cart] = Cart.new
  			session[:cart].save
  		end
  		@cart = session[:cart]
  	end
end
