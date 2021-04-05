require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(:name => "foo")
      @category.save!
    end

    it 'should save when all required fields are present' do
      product = Product.create(
        :name => 'bar',
        :price => 100,
        :quantity => 1,
        :category => @category
      )
      
      expect(product).to be_valid
    end

    it 'should validate presence of name' do
      product = Product.create(
        :price => 100,
        :quantity => 1,
        :category => @category
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Name can\'t be blank'
    end
    
    it 'should validate presence of price' do
      product = Product.create(
        :name => 'bar',
        :quantity => 1,
        :category => @category
      )
  
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Price can\'t be blank'
    end

    it 'should validate presence of quantity' do
      product = Product.create(
        :name => 'bar',
        :price => 100,
        :category => @category
      )
  
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Quantity can\'t be blank'
    end
    
    it 'should validate presence of category' do
      product = Product.create(
        :name => 'bar',
        :price => 100,
        :quantity => 1
      )
  
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Category can\'t be blank'
    end
  end
end
