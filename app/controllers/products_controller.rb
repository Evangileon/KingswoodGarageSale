
class ProductsController < ApplicationController
	def index
		@products = Admin::Product.root.ordered.includes(:product_category, :variants)
		@products = @products.group_by(&:product_category)
	end
	
	def show
		@product = Admin::Product.find_by_permalink(params[:permalink])
	end

	def buy
		@product = Admin::Product.find_by_permalink!(params[:permalink])
		current_order.order_items.add_item(@product, 1)
		redirect_to product_path(@product.permalink), :notice => "Product has been added successfuly!"
	end
end
