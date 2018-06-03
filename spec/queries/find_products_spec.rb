require 'rails_helper'

RSpec.describe FindProducts do
  let(:initial_scope) { Product.all }

  let(:params) { {category_ids: [rand(10)]} }
  let(:sort_column) { 'price' }
  let(:sort_direction) { 'DESC' }


  subject { described_class.new(initial_scope).call(params, sort_column, sort_direction) }

  context 'with sort by price' do
    it 'sorts' do
      expect(subject.to_sql).to include('ORDER BY price DESC')
    end
  end

  context 'with paginates' do
    it 'paginates' do
      expect(subject.to_sql).to include('LIMIT')
      expect(subject.to_sql).to include('OFFSET')
    end
  end

  context 'with category_ids' do
    it 'categories' do
      expect(subject.to_sql).to include('category_id')
    end
  end
end
