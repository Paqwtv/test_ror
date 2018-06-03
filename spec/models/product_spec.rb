require 'rails_helper'

RSpec.describe Product, :type => :model do
  let(:category) { create(:category) }
  subject { described_class.new(name: 'some_name', price: '12.99', category_id: category.id) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an category_id' do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
  end
end
