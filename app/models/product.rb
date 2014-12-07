
class Product < Shoppe::Product

  searchable :auto_index => true, :auto_remove => true do
    text :name
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