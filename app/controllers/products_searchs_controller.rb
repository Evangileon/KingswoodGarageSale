require 'active_support/core_ext/hash'

class ProductsSearchsController < ApplicationController
  def initialize
    super()

    Shoppe::Product.class_eval do
      searchable do
        text :name
      end

      def show_at
        5
      end
    end
    puts "append method"
  end

  def index
    @search = Sunspot.search(Shoppe::Product) do
      fulltext params[:search]
    end

    @product_searchs = @search.results
  end
end
