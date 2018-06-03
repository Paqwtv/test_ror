module ApplicationHelper
  def sort_by(column, title = nil)
    title ||= column.titleize
    direction = column.eql?(sort_column) && sort_direction.eql?('ASC') ? 'DESC' : 'ASC'
    link_to title, sort: column, direction: direction
  end
end
