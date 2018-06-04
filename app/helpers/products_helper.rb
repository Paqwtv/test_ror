module ProductsHelper
  def sort_by(column, title = nil)
    title ||= column.titleize
    direction = column.eql?(sort_column) && sort_direction.eql?('ASC') ? 'DESC' : 'ASC'
    link_to title, request.params.merge(sort: column, direction: direction)
  end
end
