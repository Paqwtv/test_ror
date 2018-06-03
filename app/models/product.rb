class Product < ApplicationRecord
  belongs_to :category

  validates_presence_of :name, :price

  def self.per_page
    50
  end
end
