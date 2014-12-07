require 'active_support/core_ext/hash'

class ProductsSearchsController < ApplicationController


  def index
    @search = Sunspot.search(Product) do
      fulltext params[:search]
    end

    # @product_searchs = Shoppe::Product.where("name LIKE '%' ? '%' OR short_description LIKE '%' ? '%'", params[:search], params[:search]).all
    @product_searchs = @search.results
    if @product_searchs.length == 0
      @product_searchs = Product.where("name LIKE '%' ? '%' OR short_description LIKE '%' ? '%'", params[:search], params[:search]).all
    end

    @product_searchs = @product_searchs.group_by(&:product_category)
  end
end
