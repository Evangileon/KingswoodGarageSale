require 'active_support/core_ext/hash'

class ProductsSearchsController < ApplicationController
  def initialize
    super()

    Shoppe::Product.class_eval do

      searchable do
        text :name, :stored => true
      end

      def self.search_by_partial_name(name)
        keywords = name.to_s.split(/\s+/).delete_if(&:blank?)

        search = Sunspot.search(self) do
          text_fields do
            keywords.each do |keyword|
              with(:name).starting_with(keyword)
            end
          end
        end

        search.results
      end

      def show_at
        5
      end
    end
    puts "append method"
  end

  def index
    # @search = Sunspot.search(Shoppe::Product) do
    #   fulltext params[:search]
    # end

    @product_searchs = Shoppe::Product.where("name LIKE '%' ? '%' OR short_description LIKE '%' ? '%'", params[:search], params[:search]).all
    @product_searchs = @product_searchs.group_by(&:product_category)
  end
end
