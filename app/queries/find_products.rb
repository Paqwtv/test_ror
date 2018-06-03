class FindProducts
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params, sort_column, sort_direction)
    scoped = search(initial_scope, params[:name])
    scoped = filter_by_price(scoped, params[:from_price], params[:to_price])
    scoped = filter_by_category(scoped, params[:category_ids])
    scoped = sort(scoped, sort_column, sort_direction)
    scoped = paginate(scoped, params[:page])
    scoped
  end

  private

  def search(scoped, query = nil)
    query ? scoped.where('name ILIKE ?', "%#{query}%") : scoped
  end

  def filter_by_price(scoped, from = nil, to = nil)
    from ? scoped.where('price > ?', from) : scoped
    to ? scoped.where('price < ?', to) : scoped
  end

  def filter_by_category(scoped, category_ids = nil)
    category_ids ? scoped.where(category_id: [category_ids]) : scoped
  end

  def sort(scoped, sort_column, sort_direction)
    scoped.order(sort_column + ' ' + sort_direction)
  end

  def paginate(scoped, page_number = 1)
    scoped.paginate(page: page_number, per_page: Product.per_page)
  end
end
