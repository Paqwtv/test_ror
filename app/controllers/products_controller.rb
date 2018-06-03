class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @products = FindProducts.new(Product.all).call(permited_params, sort_column, sort_direction)
  end

  private

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    params[:direction] || 'asc'
  end

  def permited_params
    params.permit(:search, :from_price, :to_price, :name, :page,
                  :sort, :direction, :page, :per_page, category_ids: [])
  end
end
